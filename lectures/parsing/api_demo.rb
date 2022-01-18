require "json"
require "open-uri"

# TODO - Let's fetch name and bio from a given GitHub username
url = "https://api.github.com/users/ssaunier"

require "json"
require "open-uri"

username = 'sleepycatfuji'
url = "https://api.github.com/users/#{username}"
user_json = URI.open(url).read
user = JSON.parse(user_json)

puts "#{user["name"]} lives in #{user["location"]} and have #{user["public_repos"]} many repos"