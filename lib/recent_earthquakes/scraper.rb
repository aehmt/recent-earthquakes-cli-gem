class Scraper

  def self.scrape_earthquakes
    index_url = "http://m.emsc.eu/earthquake/latest.php"
    self.scrape(index_url)
  end
  
  def self.scrape(index_url)
    doc = Nokogiri::HTML(open(index_url).read, 'utf-8') #Nokogiri::HTML.parse(thing, url, encoding, options)
    create_new_earthquakes(doc)
  end


  def self.parser(doc)
    (5..81).step(4).to_a.map {|x| doc.css('table tr')[x].text.gsub(/[\t\r\n]/,"  ")}
  end

  def self.create_new_earthquakes(doc)
    parser(doc).map do |e|
      a = e.split(/\s{3,}/)
      new_earthquake = RecentEarthquakes::Earthquake.new
      new_earthquake.create(a)
    end
  end
end