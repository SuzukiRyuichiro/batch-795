# Write the test for scraper.rb

require_relative '../scraper'

describe '#list_scraper' do
    it 'should return an array containing 5 urls' do
        top_5_urls =  [
            "https://www.imdb.com/title/tt0111161/",
            "https://www.imdb.com/title/tt0068646/",
            "https://www.imdb.com/title/tt0071562/",
            "https://www.imdb.com/title/tt0468569/",
            "https://www.imdb.com/title/tt0050083/"
        ]
        actual = list_scraper
        expect(actual).to eq(top_5_urls)
    end
end

describe "#movie_scraper" do
    it 'shoud hash containing information about a movie' do
        url = 'https://www.imdb.com/title/tt0468569/'
        dark_knight = {
          cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
          director: "Christopher Nolan",
          storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
          title: "The Dark Knight",
          year: 2008
        }
        expect(movie_scraper(url)).to eq(dark_knight)
    end
end

