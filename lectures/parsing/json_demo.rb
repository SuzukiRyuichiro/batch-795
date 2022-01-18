require "json"

# TODO - let's read/write data from beatles.json
filepath = "data/beatles.json"

parsed_json = JSON.parse(File.read(filepath))
parsed_json["beatles"].each do |beatle|
    puts "#{beatle["first_name"]} plays #{beatle["instrument"]}"
end