class RecentEarthquakes::CLI #CLI Controller

  def call
    list_recent_earthquakes
    menu
  end

  def list_recent_earthquakes
    Scraper.scrape_earthquakes
    list_earthquakes
    puts "Enter the number(1-#{@earthquakes.size}) of the location you'd like more info on or type 'list' to see the most recent earthquakes:"
  end

  def menu
    input = nil
    status = false
      
    until status == true 
      input = digit_or_letter
      case input
      when 1..@earthquakes.size 
        list_the_earthquake(input.to_i)
      when "list"
        RecentEarthquakes::Earthquake.clear
        list_recent_earthquakes
      when "exit"
        status = true
      else
        puts "\nPlease enter a valid command, '1-#{@earthquakes.size}', 'list' or 'exit':"
      end
    end
      goodbye
  end

  def goodbye
    puts "Goodbye"
  end

  def list_the_earthquake(input)
    i = input.to_i - 1
    puts "\n" + @earthquakes[i].location.colorize(:red)
    puts "========== Magnitude ===== Depth ===== Population ====== Elapsed Time ===== Local Time/Date - Time Standart ========\n".colorize(:green)
    printf("   %28s%29s%31s %33s %43s -%18s\n\n", @earthquakes[i].magnitude.colorize(:red), @earthquakes[i].depth.colorize(:red), @earthquakes[i].population.colorize(:red), @earthquakes[i].elapsed_time.colorize(:red), @earthquakes[i].local_time.colorize(:yellow), @earthquakes[i].time_standart.colorize(:yellow))
    puts "====================================================================================================================\n".colorize(:green)

  end

  def list_earthquakes
    system("clear")
    puts "\nRecent Earthquakes around the world!"
    puts "\n================================================================================== Magnitude === Local Time/Date ===\n".colorize(:green)
    @earthquakes = RecentEarthquakes::Earthquake.recent
    @earthquakes.map.with_index(1) do |earthquake, i|
      printf("   %-2s - %-78s%3s    %20s\n", i < 10? "#{i} ".colorize(:green) : i.to_s.colorize(:green), earthquake.location, earthquake.magnitude.colorize(:red), earthquake.local_time.colorize(:yellow))
    end
    puts "\n====================================================================================================================\n".colorize(:green)
  end

  def digit_or_letter
    input = gets.strip.downcase
    input.match(/\d+/).to_s.to_i == 0 ? input : input.to_i 
  end
end