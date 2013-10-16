class SiteGenerator
  
  def initialize
    @songs = Song.all
    @genre = Genre.all
    @artist = Artist.all
  end

  def index_page
   
  end
  
  def artist_index
    artist_index = ERB.new(File.open('../lib/views/artists.erb').read)
    Artist.all.each do |artist|
      File.open("../_site/artist.html", 'w+') do |f|
        f << artist_index.result(binding)
      end
    end
  end

  def genre_index
    genre_index = ERB.new(File.open('../lib/views/genre.erb').read)
    Genre.all.each do |genre|
      File.open("../_site/genre.html", 'w+') do |f|
        f << genre_index.result(binding)
      end
    end
  end
  
  def artist_pages
    show = ERB.new(File.open('../lib/views/artist_pages.erb').read)
    Artist.all.each do |artist|
      File.open("../_site/artists/#{artist.name.downcase.gsub(/\s+/, "")}.html", 'w+') do |f|
        f << show.result(binding)
      end
    end
  end

  def genre_pages
    show = ERB.new(File.open('../lib/views/genre_pages.erb').read)
    Artist.all.each do |artist|
      File.open("../_site/genres/#{artist.name.downcase.gsub(/\s+/, "")}.html", 'w+') do |f|
        f << show.result(binding)
      end
    end
  end
  
end