require_relative '../config/environment.rb'

test = LibraryParser.new('../data')

test.parse

sitegenerator = SiteGenerator.new
sitegenerator.generate_all