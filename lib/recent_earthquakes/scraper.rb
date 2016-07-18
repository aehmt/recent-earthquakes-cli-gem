require 'pry'
require 'nokogiri'
require 'open-uri'
class Scraper
@@doc = []

  def self.scrape(index_url)
    @@doc = Nokogiri::HTML(open(index_url))
    create_new_earthquakes
  end

  def self.parser
    (5..61).step(4).to_a.map {|x| @@doc.css('table tr')[x].text.gsub(/[\t\r\n]/,"  ") }
  end

  def self.create_new_earthquakes
    parser.map do |e|
      a = e.split(/\s{3,}/)
      new_earthquake = RecentEarthquakes::Earthquakes.new
      new_earthquake.location = a[1][28..-1] +", " + a[3].split("/")[0].strip
      new_earthquake.local_time = a[3].split("/")[2].gsub("local time:", "").strip
      new_earthquake.magnitude = a[1][23..26]
      new_earthquake.elapsed_time = a[2].split("D").first # a[2].match(/.*o/).to_s
      new_earthquake.population = a[3].split("/")[1].gsub("pop:","").strip
      new_earthquake.depth = a[2][a[2].index("Depth")..-1]
      new_earthquake.time_standart = a[1].split(" ")[1]
      new_earthquake.save
    end
  end
end
