class Cli
  attr_accessor :songs, :genres, :artists, :on
  APPROVED_COMMANDS = [:browse,:exit,:help,:songs, :artists, :genres, :play]

  def initialize
    @on = true
    @genres = Genre.all
    @songs = Song.all
    @artists = Artist.all
  end

  def call
    puts "Welcome to Playlister"
    while @on
      puts "What would you like to do: Browse: Help: or Exit:"
      parse_input(gets)
    end
  end

  def parse_input(string)
    input = string.strip.downcase.to_sym
    self.send(input) if APPROVED_COMMANDS.include?(input)
  end 

  def browse
    puts "Would you like to browse by Songs, Artists or Genres"
    type = gets.strip.downcase
    case type
      when "songs"
        songs.each{|song| puts song.name }
        play_option
      when "artists"
        artists.each{|artist| puts artist.name}
        puts "Select an artist to see all the songs"
        artist = gets.strip.downcase
        browse_by_artist(artist)
      when "genres"
        genres.each{|genre| puts genre.name}
        puts "Select a genre to see all the songs"
        genre = gets.strip.downcase
        browse_by_genre(genre)
      when "exit"
        exit
      when "play"
        puts "Select a song to play by it's name"
      else
        help
    end
  end

  def play_option
    puts "select a song by its name to play it, type back to return to the main menu"
    # input = gets.strip.downcase
    str = gets.strip.downcase
    exit if str == "exit"
    return if str == "back" || str == "cancel"
    songs.each do |song|
      puts "Now Playing: #{song.name} by #{song.artist.name}" if str.downcase == song.name.downcase
    end
  end

  def browse_by_genre(str)
    exit if str == "exit"
    return if str == "back" || str == "cancel"
    songs.each do |song|
      puts "#{song.artist.name} - #{song.name}" if str.downcase == song.genre.name.downcase
    end
    play_option
  end

  def browse_by_artist(str)
    exit if str == "exit"
    return if str == "back" || str == "cancel"
    songs.each do |song|
      puts "#{song.name} - #{song.genre.name}" if str.downcase == song.artist.name.downcase
    end
    play_option
  end 

  def all(object)
    self.send(object.to_sym).each do |song|
      puts "#{song.name}"
    end
  end 

  def help
  end

  def exit
    self.on = false
  end

end 