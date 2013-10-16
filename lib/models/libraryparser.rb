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

      Song.new.tap do |s| 
        s.name = song_name
        s.genre = genre_name
        s.artist = artist_name
      end
    end
  end
end




