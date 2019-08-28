# code handling CLI display logic and user input
class TravelLeisure::CLI #:: name space
    def call
      TravelLeisure::Scraper.new.make_destinations
      puts ""
      puts ""
      puts " ------------------------------------------------ ".blue
      puts "|                                                |".blue
      puts "|    Welcome to Command Line Travel Guides       |".blue.bold
      puts "|                                                |".blue
      puts " ------------------------------------------------ ".blue
      puts ""
      puts ""

      menu
    end

    def menu

        puts "To view the destinations that we have travel guides for, enter 'travel'.".yellow.bold
        puts "or enter 'q' to exit".yellow.bold

        input = gets.strip.downcase

        if input == 'travel'
          puts ""
          puts "Here is a list of destinations that we have travel guides for:".yellow.bold
          puts ""

          print_destinations

        elsif input == "q"
          exit
        else
          puts ""
          puts "I don't understand that answer, please try again:".red.bold
          puts ""
          menu
        end

        puts "\nPlease enter the number of the travel guide you would like to access\nor enter 'q' to exit:".yellow.bold
        input = gets.strip
        if input == 'q'
          exit
        elsif
          destination = TravelLeisure::Destination.find(input.to_i)
          print_destination(destination)
        
        end
      
        puts ""
        puts "Would you like to see another travel guide? Enter Y or N".yellow.bold

        input = gets.strip.downcase
        if input == "y"
          menu
        elsif input == "n"
          puts ""
          puts "Thank you! Have a great day!".yellow.bold
          exit
        else
          puts ""
          puts "I don't understand that answer.".red.bold
          menu
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
      puts ""
      puts "Would you like to read more on #{destination.city}? Enter Y or N".yellow.bold

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