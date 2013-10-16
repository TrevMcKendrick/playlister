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
        set_genre 
        set_artist
      end
    end
  end

  def set_genre
    if genre
  end

  def set_artist
  end

end














# def exists?
#   #check if it exists
# end

# def assign(object) 
#   if !exists? 
#     object.new.tap{ |o| o.name = genre_name}
#   elsif condition
    
#   end
# end 



