class RecentEarthquakes::Earthquakes
  attr_accessor :location, :time, :magnitude


  def self.recent
    puts <<-DOC
    1. Tokyo ------ 5.0 
    2. Seul ------- 3.0
    3. Istanbul --- 3.5
    4. California - 5.0
    5. Delhi ------ 6.0
    6. Moscow ----- 3.4
    7. Atlanta ---- 4.7
    8. Hong Kong -- 4.5
    9. London ----- 4.0
    10. Florida --- 3.0
    DOC

  end



end