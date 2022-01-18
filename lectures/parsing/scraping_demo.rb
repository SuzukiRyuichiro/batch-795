require "open-uri"
require "nokogiri"

# Let's scrape recipes from https://www.bbcgoodfood.com
ingredient = "chocolate" # You can set this into any keyword
url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

# Open the url and get the text
html_file = URI.open(url).read
# Convert it into something we can play in Ruby
html_doc = Nokogiri::HTML(html_file)

html_doc.search(".standard-card-new__article-title").each do |element|
  puts element.text.strip
end