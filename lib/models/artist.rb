class Artist
  attr_accessor :name, :songs
  @@artists = []

  def initialize
    @songs = []
    @@artists << self
  end

  def add_song(song)
    self.songs << song
    song.artist = self  
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end

  def self.all
    @@artists
  end

  def self.count
    @@artists.count
  end

  def self.reset_artists
    @@artists.clear
  end

end