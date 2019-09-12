class TravelLeisure::CLI

    def start
      greeting
      TravelLeisure::Destination.load
      menu
    end

    def greeting
      puts "\nWelcome to Command Line Travel Guides!".blue.bold
      puts "Would you like to see our list of destinations?".yellow
      puts "If so, please type 'Yes' or 'Y'!".yellow
    end

    def good_bye
      puts "Thank you for checking out Command Line Travel Guides!".yellow.bold
      exit!
    end

    def menu 
        input = gets.strip.downcase
        if input == "yes" || input == "y"
          menu_helper
        elsif input == "exit" || input == "e"
          good_bye         
        else
          puts "Sorry! I didn't understand that input, please try again".red.bold
          puts "Would you like to see our list?".yellow
          puts "If so, please type 'Yes' or 'Y' or exit.".yellow
          menu 
        end
    end

    def menu_helper
      list_destinations
      select_destination
    end

    def list_destinations
      TravelLeisure::Destination.all.each.with_index(1) do |destination, index|
            puts "#{index}. #{destination.city}, #{destination.country}"
      end
    end

    def select_destination
      puts "\nPlease enter the number of the travel guide you would like to access:".yellow.bold
        input = gets.strip
        destination = TravelLeisure::Destination.find(input.to_i)
        if input == "exit" || input == "e"
          good_bye
        elsif input.to_i.between?(1,TravelLeisure::Destination.all.length)
          print_destination(destination)
        else
          puts "Sorry! I didn't understand that input, please try again".red.bold
          select_destination
        end
    end

    def print_destination(destination)
      puts ""
      puts "----------- #{destination.city}, #{destination.country} -----------".blue.bold
      puts ""
      puts "Best Time To Visit: #{destination.best_time_to_visit}".green.bold
      puts "\nTransportation: #{destination.transportation}".green.bold
      puts "\nWeather: #{destination.weather}".green.bold
      puts "\nKnow Before Visiting: #{destination.know_before_visiting}".green.bold
      puts "\nLanguage: #{destination.language}".green.bold
      puts "\nCurrency: #{destination.currency}".green.bold
      puts "\nWould you like to read more on #{destination.city}? Please enter 'Y' or 'N'".yellow.bold
        input = gets.strip.downcase
        case input
        when 'y' || 'yes'
          puts ""
          puts "More info:".yellow
          puts ""
          puts destination.description
          alt_menu
        when 'n' || 'no'
          alt_menu
        when 'exit'
          good_bye
        else
          puts ""
          puts "Sorry, I didn't understand that input.".red.bold
          alt_menu
        end
    end

    def alt_menu
      puts "\nWould you like to see another travel guide? Type 'Yes' or 'Y' ".yellow.bold
      puts "\nWould you like to exit? Type 'E' or 'Exit' ".yellow.bold
      input = gets.strip.downcase
      if input == 'yes' || input == 'y'
        menu_helper
      elsif input == 'exit' || input == 'e'
        good_bye
      else
        puts "Sorry, I didn't understand that input.".red.bold
        alt_menu
      end
    end

    
  
end