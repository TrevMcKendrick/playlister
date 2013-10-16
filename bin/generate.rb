require_relative '../config/environment.rb'

test = LibraryParser.new('../data')

test.parse

binding.pry