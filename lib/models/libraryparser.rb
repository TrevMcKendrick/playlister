class LibraryParser
  attr_accessor :path, :song, :artist_name, :song_name, :genre_name

  def initialize(path)
    @path = path 
  end 

  def collect_names(objects)
    objects.all.collect do |object|
      object.name if object
    end
  end

  def add_song_to_artist
    Artist.all.each do |artist|
      artist.add_song(song) if artist.name == artist_name
    end
  end

  def make_artist_with_song
    Artist.new.tap do |artist|
      artist.name = artist_name
      artist.add_song(song)
    end
  end

  def add_song_to_genre
    Genre.all.each do |genre|
      if genre.name == genre_name
        song.genre = genre
        genre.songs << song
      end
    end
  end

  def make_genre_with_song
    Genre.new.tap do |genre|
      song.genre = genre
      genre.name = genre_name
      genre.songs << song
    end
  end

  def song_to(object)
    name = self.send("#{object.to_s.downcase}_name")
    if collect_names(object).include?(name)
      self.send("add_song_to_#{object.to_s.downcase}".to_sym)
    else
      self.send("make_#{object.to_s.downcase}_with_song".to_sym)
    end
  end

  def parse
    Dir.foreach(path) do |item|
      next if item == '.' or item == '..'
      @artist_name = item.split(" - ").shift
      @song_name = item.split(" - ")[1].split(" [")[0]
      @genre_name = item.split(" - ")[1].split(" [")[1].gsub("].mp3","")

      @song = Song.new.tap{ |s| s.name = song_name }

      song_to(Artist)
      song_to(Genre)
    end
  end
end