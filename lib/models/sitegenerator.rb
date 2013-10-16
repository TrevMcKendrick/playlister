require_relative '../../config/environment.rb'

class SiteGenerator
  
  def initialize
    @songs = Song.all
    @genre = Genre.all
    @artist = Artist.all
  end

  def index_page
   
  end

  def artists_page
    show = ERB.new(File.open('lib/views/artists.erb').read)
    Artist.all.each do |artist|
      File.open("_site/artists/#{artist.name}.html", 'w+') do |f|
        f << show.result(binding)
      end
    end
  end

  def genre_pages
    show = ERB.new(File.open('lib/views/genre.erb').read)
    Genre.all.each do |genre|
      File.open("_site/genres/#{genre.name}.html", 'w+') do |f|
        f << show.result(binding)
      end
    end
  end

  def generate_all
    index_page
    artists_page
    genre_page
  end

end