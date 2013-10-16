require_relative './spec_helper.rb'

describe "Song" do
  it "can initialize a song" do
    Song.new.should be_an_instance_of(Song)
  end

  it "can have a name" do
    song = Song.new
    song.name = "lkjsdf"
    song.name.should eq ('lkjsdf')
  end

  it "can have a genre" do
    song = Song.new
    song.should_respond_to(:genre)
  end

  it "has an artist" do
    song = Song.new
    song.artist = "Tom Waits"
    song.artist.should eq("Tom Waits")
  end
end
