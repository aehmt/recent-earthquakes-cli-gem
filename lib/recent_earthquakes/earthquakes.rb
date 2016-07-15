class RecentEarthquakes::Earthquakes
  attr_accessor :location, :local_time, :magnitude, :elapsed_time, :population
  @@earthquakes = []

  def self.recent
    @@earthquakes
  end

  def self.scrape_earthquakes
    index_url = "http://m.emsc.eu/earthquake/latest.php"
    @@doc = Nokogiri::HTML(open(index_url))
    arr = (5..45).step(4).to_a.map {|x| @@doc.css('table tr')[x].text.gsub(/[\t\r\n]/," ") }
    
    # arr.map do |earthquake|
    #     earthquake.split(" ").map do |info|
    #         new_earthquake = self.new
    #         new_earthquake.location = "#{info[3]}



    @@earthquakes

    # arr.map do
    #     earthquake_1 = self.new
    #     earthquake_1.location = "#{arr[0].gsub("\r", "").gsub("\n", " ").gsub("\t","").split(" ")[12]} #{arr[0].gsub("\r", "").gsub("\n", " ").gsub("\t","").split(" ")[13]}"
    #     earthquake_1.magnitude = arr[0].gsub("\r", "").gsub("\n", " ").gsub("\t","").split(" ")[2]
    #     earthquake_1.local_time = "#{arr[0].gsub("\r", "").gsub("\n", " ").gsub("\t","").split(" ")[20]} UTC, #{arr[0].gsub("\r", "").gsub("\n", " ").gsub("\t","").split(" ")[21]}"
    #     self
    # end
    
    binding.pry

    [earthquake_1, earthquake_2] 
  end



end
