require_relative '../config/environment.rb'

test = LibraryParser.new('../data')
test.parse

sitegenerator = SiteGenerator.new
sitegenerator.index_page
sitegenerator.artist_index
sitegenerator.artist_pages
sitegenerator.genre_index
sitegenerator.genre_pages
sitegenerator.song_index
sitegenerator.song_pages

run = Cli.new
run.call