# Write methods for scraping IMDB
# require 'nokogiri' 'open-uri'
require 'nokogiri' 
require 'open-uri'


# method for getting the list (scraping the movie list page)
def list_scraper
    # open top movie list
    html_doc = URI.open('https://www.imdb.com/chart/top').read
    parsed_page = Nokogiri::HTML(html_doc)
    # find the movie list element, parse the list, choose top 5 of the array
    parsed_page.search('.titleColumn a').first(5).map do |element|
        # get the url for individual movies
        # returns an array, link for each movies
        "https://www.imdb.com#{element.attribute('href').value}"
    end
end

# method for scraping the idividual movie page
def movie_scraper(url)
    # open the individual movie pages. Set language to make sure we get English
    html_doc = URI.open(url, "Accept-Language" => "en-US").read
    # parse the page using nokogiri
    parsed_page = Nokogiri::HTML(html_doc)
    # using css selectors, extract, year, title, storyline....
    # hash containing information about a movie
    # Note: basically, for elements which can be found multiple times with a CSS selector, you can pinpoint to the one you want with index (in this case, all of them are first)
    {
        cast: parsed_page.search('.ezTgkS').first(3).map { |element| element.text },
        director: parsed_page.search('.ipc-metadata-list-item__list-content-item, .ipc-metadata-list-item__list-content-item--link').first.text,
        storyline: parsed_page.search('.eqbKRZ').first.text,
        title: parsed_page.search('h1').first.text,
        year: parsed_page.search('.TitleBlockMetaData__StyledTextLink-sc-12ein40-1')[0].text.to_i
    }
end