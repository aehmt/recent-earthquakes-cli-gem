class RecentEarthquakes::Earthquake
  attr_accessor :location, :local_time, :magnitude, :elapsed_time, :population, :depth, :time_standart
  @@earthquakes = []

  def self.recent
    @@earthquakes
  end

  def save
    @@earthquakes << self
    self
  end
end


