require_relative '../../config/environment.rb'

class SiteGenerator
  
  def initialize
    @songs = Song.all
    @genre = Genre.all
  end

  def index_page
   
  end

  def genre_pages
    
    show = ERB.new(File.open('lib/views/genre.erb').read)
    Genre.all.each do |genre|
      File.open("_site/genres/#{genre.name}.html", 'w+') do |f|
        f << show.result(binding)
      end
    end
  end

end