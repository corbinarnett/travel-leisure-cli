# code handling CLI display logic and user input
class TravelLeisure::CLI #:: name space
    def call
      TravelLeisure::Scraper.new.make_destinations
      puts ""
      puts ""
      puts " ------------------------------------------------ "
      puts "|                                                |"
      puts "|    Welcome to Command Line Travel Guides       |"
      puts "|                                                |"
      puts " ------------------------------------------------ "
      puts ""
      puts ""

      menu
    end

    def menu
        puts "To view the destinations that we have travel guides for, enter 'travel'."
        puts "or enter 'q' to exit"
        input = gets.strip.downcase
        if input == 'travel'
          puts ""
        puts "Here is a list of destinations that we have travel guides for:"
        puts ""
        print_destinations
        elsif input == "q"
          exit
        else
          puts ""
          puts "I don't understand that answer, please try again:"
          puts ""
          menu
        end
        # puts ""
        # puts "Here is a list of destinations that we have travel guides for:"
        # puts ""
        # print_destinations


        puts "\nPlease enter the number of the travel guide you would like to access\nor enter 'q' to exit:"
        input = gets.strip
        if input == 'q'
          exit
        elsif
          destination = TravelLeisure::Destination.find(input.to_i)
          print_destination(destination)
        end
        # destination = TravelLeisure::Destination.find(input.to_i)

        # print_destination(destination)
      
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
          puts ""
          puts "More info:"
          puts ""
          puts destination.description
        elsif input == "n"
          menu
        elsif input == "q"
          exit
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