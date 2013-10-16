require_relative '../config/environment.rb'

test = LibraryParser.new('../data')
test.parse

sitegenerator = SiteGenerator.new
sitegenerator.artist_index
sitegenerator.artist_pages
sitegenerator.genre_index
sitegenerator.genre_pages