class RecentEarthquakes::Earthquakes
  attr_accessor :location, :local_time, :magnitude, :elapsed_time, :population, :depth, :time_standart
  @@earthquakes = []

  def self.recent
    @@earthquakes
  end

  def self.scrape_earthquakes
    index_url = "http://m.emsc.eu/earthquake/latest.php"
    Scraper.scrape(index_url)
  end

  def save
    @@earthquakes << self
  end
end


