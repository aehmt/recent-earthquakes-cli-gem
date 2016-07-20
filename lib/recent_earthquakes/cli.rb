class RecentEarthquakes::CLI #CLI Controller

  def call
    list_recent_earthquakes
    menu
  end

  def list_recent_earthquakes
    Scraper.scrape_earthquakes
    system("clear")
    puts "\nRecent Earthquakes around the world!"
    puts "\n================================================================================== Magnitude === Local Time/Date ===\n".colorize(:green)
    @earthquakes = RecentEarthquakes::Earthquake.recent
    @earthquakes.map.with_index(1) do |earthquake, i|
      printf("   %-2s - %-78s%3s    %20s\n", i, earthquake.location, earthquake.magnitude.colorize(:red), earthquake.local_time.colorize(:yellow))
    end
    puts "\n"
  end

  def menu
    input = nil
    while input != "exit" 
    puts "====================================================================================================================\n".colorize(:green)
    puts "Enter the number(1-#{@earthquakes.size}) of the location you'd like more info on or type 'list' to see the most recent earthquakes:"
      input = gets.strip

      if input.to_i > 0 && input.to_i < (@earthquakes.size + 1)
        i = input.to_i - 1
        puts ""
        puts @earthquakes[i].location.colorize(:red)
        puts "========== Magnitude ===== Depth ===== Population ====== Elapsed Time ===== Local Time/Date - Time Standart ========\n".colorize(:green)
        printf("   %28s%29s%31s %33s %43s -%18s\n", @earthquakes[i].magnitude.colorize(:red), @earthquakes[i].depth.colorize(:red), @earthquakes[i].population.colorize(:red), @earthquakes[i].elapsed_time.colorize(:red), @earthquakes[i].local_time.colorize(:yellow), @earthquakes[i].time_standart.colorize(:yellow))
        puts ""
      elsif input == "list"
        RecentEarthquakes::Earthquake.clear
        list_recent_earthquakes
      elsif input.downcase.strip == "exit"
        goodbye
      else
        puts "\nPlease enter a valid command, 'list' or 'exit':"
      end
    end
  end

  def goodbye
    puts "Goodbye"
  end
end