# Use methods written in scraper.rb for inspection!

require_relative 'scraper'
require 'yaml'

# Get array of urls
puts "Getting URLs for top 5 movies"
movie_list = list_scraper

# Map them into an array of hashes containing movie info
puts "Getting information of individual movies"
movies = movie_list.map { |url| movie_scraper(url) }

puts "Writing movies.yml"
File.open("movies.yml", "w") do |file|
  file.write(movies.to_yaml)
end