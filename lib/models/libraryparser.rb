class LibraryParser
  attr_accessor :path

  def initialize(path)
    @path = path 
  end 

  def parse
    Dir.foreach(path) do |item|
      next if item == '.' or item == '..'
      artist_name = item.split(" - ").shift
      song_name = item.split(" - ")[1].split(" [")[0]
      genre_name = item.split(" - ")[1].split(" [")[1].gsub("].mp3","")


      temp_song = Song.new.tap{ |s| s.name = song_name }

      artist_names = Artist.all.collect do |artist|
        artist.name if artist
      end

      if artist_names.include?(artist_name)
        Artist.all.each do |artist|
          artist.add_song(temp_song) if artist.name == artist_name
        end
      else 
        Artist.new.tap do |artist|
          artist.name = artist_name
          artist.add_song(temp_song)
        end
      end

      genre_names = Genre.all.collect do |genre|
        genre.name if genre
      end

      if genre_names.include?(genre_name)
        Genre.all.each do |genre|
          if genre.name == genre_name
            temp_song.genre = genre
            genre.songs << temp_song
            # genre.songs << temp_song.artist
          end
        end
      else
        Genre.new.tap do |genre|
          temp_song.genre = genre
          genre.name = genre_name
          genre.songs << temp_song
          # genre.songs << temp_song.artist
        end
      end
    end
  end
end





      # Artist.new.tap do |a| 
      #   a.name = artist_name 
      #   a.add_song(Song.new.tap do |s| 
      #     s.name = song_name 
      #     s.genre = (Genre.new.tap{ |g| g.name = genre_name })
      #   end)
      # end