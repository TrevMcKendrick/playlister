class SiteGenerator
  
  def initialize
    @songs = Song.all
    @genre = Genre.all
    @artist = Artist.all
    create_folders
  end

  def index_page
    index = ERB.new(File.open('../lib/views/index.erb').read)
      File.open("../_site/index.html", 'w+') do |f|
      f << index.result(binding)
    end
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
    Genre.all.each do |genre|
      File.open("../_site/genres/#{genre.name.downcase.gsub(/\s+/, "")}.html", 'w+') do |f|
        f << show.result(binding)
      end
    end
  end

  def artist_pages
    artist_page = ERB.new(File.open('../lib/views/song_pages.erb').read)
    Song.all.each do |song|
      File.open("../_site/songs/#{song.name.downcase.gsub(/\s+/, "")}.html", 'w+') do |f|
        f << artist_page.result(binding)
      end
    end
  end

  def create_folders
    system 'mkdir "../_site/"'
    system 'mkdir "../_site/genres/"'
    system 'mkdir "../_site/artists/"'
    system 'mkdir "../_site/songs/"'
  end
  
end
