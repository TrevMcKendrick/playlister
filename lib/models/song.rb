class Song
  attr_accessor :genre, :name, :artist
  @@songs = []

  def initialize
    @@songs << self
  end

  def self.all
    @@songs
  end

  def self.count
    @@songs.count
  end

  def self.reset_songs
    @@songs = []
  end

end