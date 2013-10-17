class LibraryParser
  attr_accessor :path, :artist_name, :song_name, :genre_name, :temp_song

  def initialize(path)
    @path = path 
  end 

  def collect_names(objects)
    objects.all.collect do |object|
      object.name if object
    end
  end

  def add_song_when_artist
    Artist.all.each do |artist|
      artist.add_song(@temp_song) if artist.name == @artist_name
    end
  end

  def make_artist_with_song
    Artist.new.tap do |artist|
      artist.name = @artist_name
      artist.add_song(@temp_song)
    end
  end

  def add_song_when_genre
    Genre.all.each do |genre|
      if genre.name == @genre_name
        @temp_song.genre = genre
        genre.songs << @temp_song
      end
    end
  end

  def make_genre_with_song
    Genre.new.tap do |genre|
      @temp_song.genre = genre
      genre.name = @genre_name
      genre.songs << @temp_song
    end
  end

  def song_to_genre
    if collect_names(Genre).include?(@genre_name)
      add_song_when_genre
    else
      make_genre_with_song
    end
  end

  def song_to_artist
    if collect_names(Artist).include?(@artist_name)
      add_song_when_artist
    else 
      make_artist_with_song
    end
  end

  def parse
    Dir.foreach(path) do |item|
      next if item == '.' or item == '..'
      @artist_name = item.split(" - ").shift
      @song_name = item.split(" - ")[1].split(" [")[0]
      @genre_name = item.split(" - ")[1].split(" [")[1].gsub("].mp3","")
      
      @temp_song = Song.new.tap{ |s| s.name = @song_name }

      song_to_artist
      song_to_genre
    end
  end
end