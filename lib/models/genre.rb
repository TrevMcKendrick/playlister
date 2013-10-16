class Genre
  attr_accessor :name, :artists, 
  @@genres = []
  @@songs = []


  def initialize(name)
    @name = name
    @@genres << self 
  end 

  def self.reset
  end

  def self.all
    @@songs
  end


end 