class Scraper
  
  def self.scrape(index_url)
    doc = Nokogiri::HTML(open(index_url).read, nil, 'utf-8') #Nokogiri::HTML.parse(thing, url, encoding, options)
    create_new_earthquakes(doc)
  end

  def self.scrape_earthquakes
    index_url = "http://m.emsc.eu/earthquake/latest.php"
    self.scrape(index_url)
  end

  def self.parser(doc)
    (5..61).step(4).to_a.map {|x| doc.css('table tr')[x].text.gsub(/[\t\r\n]/,"  ") }
  end

  def self.create_new_earthquakes(doc)
    parser(doc).map do |e|
      a = e.split(/\s{3,}/)
      new_earthquake = RecentEarthquakes::Earthquake.new
      new_earthquake.location = (a[1][28..-1] + ", " + a[3].split("/")[0].strip) #.gsub(/[\u0080-\u00ff]/, "") #.gsub("\\u","")
      new_earthquake.local_time = a[3].split("/")[2].gsub("local time:", "").strip
      new_earthquake.magnitude = a[1][23..26]
      new_earthquake.elapsed_time = a[2].split(/[FD]/).first # a[2].match(/.*o/).to_s
      new_earthquake.population = a[3].split("/")[1].gsub("pop:","").strip
      new_earthquake.depth = a[2][a[2].index(":")..-1].gsub(":", "")
      new_earthquake.time_standart = a[1].split(" ")[1]
      new_earthquake.save
    end
  end
end
