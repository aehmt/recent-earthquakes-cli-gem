require 'pry'
require 'nokogiri'
require 'open-uri'
class Scraper

  def self.scrape(index_url)

    @@doc = Nokogiri::HTML(open(index_url))
    binding.pry
  end

end
#index_url = "http://earthquake.usgs.gov/earthquakes/map/"
# index_url = "http://m.emsc.eu/earthquake/latest.php?min_mag=n/a&max_mag=n/a&date=n/a&euromed=World"
index_url = "http://m.emsc.eu/earthquake/latest.php"

puts Scraper.scrape(index_url)
=begin
arr = []
count = 5
10.times do
  arr << @@doc.css('table tr')[count].text
  count += 4
end
=end

(5..45).step(4).to_a.collect {|x| @@doc.css('table tr')[x].text}
