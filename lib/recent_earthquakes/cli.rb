class RecentEarthquakes::CLI #CLI Controller

  def call
    system("clear")
    Scraper.scrape_earthquakes
    list_recent_earthquakes
    menu
  end

  def list_recent_earthquakes
    puts "\nRecent Earthquakes around the world!"
    puts "\n======================================================================== Magnitude === Local Time/Date ===".colorize(:green)
    puts "\n"
    @earthquakes = RecentEarthquakes::Earthquake.recent
    @earthquakes.map.with_index(1) do |earthquake, i|
      printf(" %-2s - %-70s%3s    %20s\n", i, earthquake.location, earthquake.magnitude.colorize(:red), earthquake.local_time.colorize(:yellow))
    end
    puts "\n"
  end

  def menu
    input = nil
    while input != "exit" 
    puts "==========================================================================================================".colorize(:green)
    puts "\nEnter the number of the location you'd like more info on or type 'list' to see most recent earthquakes:"
      input = gets.strip

      if input.to_i > 0 && input.to_i < 16
        i = input.to_i - 1
        puts "\n"
        puts @earthquakes[i].location.colorize(:red)
        puts "======= Magnitude ===== Depth ===== Population ===== Elapsed Time ===== Local Time - Time Standart =======".colorize(:green)
        puts "\n"
        printf("%28s%29s%31s%33s%43s%18s\n", @earthquakes[i].magnitude.colorize(:red), @earthquakes[i].depth.colorize(:red), @earthquakes[i].population.colorize(:red), @earthquakes[i].elapsed_time.colorize(:red), @earthquakes[i].local_time.colorize(:yellow), @earthquakes[i].time_standart.colorize(:yellow))
        puts "\n"
      elsif input == "list"
        system("clear")
        list_recent_earthquakes
      elsif input.downcase.strip == "exit"
        goodbye
      else
        puts "Please enter a valid command, list or exit:"
      end
    end
  end

  def goodbye
    puts "Goodbye"
  end
end