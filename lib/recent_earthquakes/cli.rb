#CLI Controller
class RecentEarthquakes::CLI

  def call
    puts "Recent Earthquakes around the world!"
    list_recent_earthquakes
    menu
    goodbye
  end

  def list_recent_earthquakes
    @earthquakes = RecentEarthquakes::Earthquakes.recent
    @earthquakes.each.with_index(1) do |earthquake, i|
      puts "#{i}. #{earthquake.location} - #{earthquake.magnitude} - #{earthquake.local_time}"
    end

  end

  def menu
    input = nil
    while input != "exit" 
    puts "Enter the number of the location you'd like more info on or type list to see most recent earthquakes:"
      input = gets.strip

      if input.to_i > 0
        puts @earthquakes[input.to_i - 1]
      elsif input == "list"
        list_recent_earthquakes
      else
        puts "Please enter a valid command, list or exit:"
      end
    end
  end

  def goodbye
    puts "Goodbye"
  end

end