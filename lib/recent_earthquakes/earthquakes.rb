class RecentEarthquakes::Earthquake
  attr_accessor :location, :local_time, :magnitude, :elapsed_time, :population, :depth, :time_standart
  @@earthquakes = []

  def self.recent
    @@earthquakes
  end

  def self.clear
    @@earthquakes.clear
  end

  def save
    @@earthquakes << self
    self
  end

  def create(a)
      self.location = (a[1][28..-1] + ", " + a[3].split("/")[0].strip)
      self.local_time = a[3].split("/")[2].gsub("local time:", "").strip
      self.magnitude = a[1][23..26]
      self.elapsed_time = a[2].split(/[FD]/).first # a[2].match(/.*o/).to_s
      self.population = a[3].split("/")[1].gsub("pop:","").strip
      self.depth = a[2][a[2].index(":")..-1].gsub(":", "")
      self.time_standart = a[1].split(" ")[1]
      self.save
  end
end