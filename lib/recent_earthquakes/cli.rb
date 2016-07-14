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
  end

  def menu
    input = nil
    while input != "exit" 
    puts "Enter the number of the location you'd like more info on or type list to see most recent earthquakes:"
      input = gets.strip

      case input 
      when "1"
        puts "more info on 1"
      when "2"
        puts "more info on 2"
      when "3"
        puts "more info on 3"
      when "4"
        puts "more info on 4"
      when "5"
        puts "more info on 5"
      when "6"
        puts "more info on 6"
      when "7"
        puts "more info on 7"
      when "8"
        puts "more info on 8"
      when "9"
        puts "more info on 9"
      when "10"
        puts "more info on 10"
      when "list"
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