# require_relative '../../config/environment.rb'

class Genre
  attr_accessor :name, :songs, :artists
  @@genres = []


  def initialize
    @@genres << self
  end 

  def self.all
    @@genres
  end

  def songs
    songs = Song.all.select do |song|
      song if song.genre.name == self.name
    end
  end

  def artists
    artists = songs.collect do |song|
      song.artist if song.genre.name == self.name
    end.uniq
  end

  def self.reset_genres
    @@genres = []
  end

  def self.genres
    @@genres
  end

  def self.count
    @@genres.count
  end


end 