# code handling CLI display logic and user input
class TravelLeisure::CLI #:: name space
    def call
      TravelLeisure::Scraper.new.make_destinations
      puts "\nWelcome to Command Line Travel Guides!"
      menu
    end

    def menu
      input = ""
      while input != "exit"
      puts ""
      print_destinations
      puts "\nPlease enter the number of the travel guide you would like to access:"
      input = gets.strip.to_i

      destination = TravelLeisure::Destination.find(input)

      print_destination(destination)
      
      puts ""
      puts "Would you like to see another travel guide? Enter Y or N"

      input = gets.strip.downcase
      if input == "y"
        menu
      elsif input == "n"
        puts ""
        puts "Thank you! Have a great day!"
        exit
      else
        puts ""
        puts "I don't understand that answer."
        menu
      end
      
      end
    end

    def print_destination(destination)
      puts ""
      puts "----------- #{destination.city}, #{destination.country} -----------"
      puts ""
      puts "Best Time To Visit: #{destination.best_time_to_visit}"
      puts "\nTransportation: #{destination.transportation}"
      puts "\nWeather: #{destination.weather}"
      puts "\nKnow Before Visiting: #{destination.know_before_visiting}"
      puts "\nLanguage: #{destination.language}"
      puts "\nCurrency: #{destination.currency}"
      puts ""
      puts "Would you like to read more on #{destination.city}? Enter Y or N"

        input = gets.strip.downcase
        if input == "y"
          puts destination.description
        elsif input == "n"
          menu
        else
          puts ""
          puts "I don't understand that answer."
          menu
        end
    end

    def print_destinations
      TravelLeisure::Destination.all.each.with_index(1) do |destination, index|
        puts "#{index}. #{destination.city}, #{destination.country}"
      end
    end
end