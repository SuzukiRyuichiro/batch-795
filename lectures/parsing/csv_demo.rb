require "csv"

# TODO - let's read/write data from beatles.csv
filepath = "data/beatles.csv"

# Puts the header, not ideal
# CSV.foreach(filepath) do |row|
#   puts "#{row[0]} plays #{row[2]}"
# end

# More readable
CSV.foreach(filepath, headers: :first_row) do |row|
  puts "#{row["First Name"]} plays #{row["Instrument"]}"
end