# code handling CLI display logic and user input
class TravelLeisure::CLI #:: name space
    def call
      TravelLeisure::Scraper.new.make_destinations
      puts "\nWelcome to Command Line Travel Guides!"
      start
      # get_destinations
      # list_destinations_with_index
      # get_user_destination
      #display_destination_info(user_input)
    end

    def start

    end

    def print_destinations
      
    end

    # def get_destinations
    #   TravelLeisure::Destination.all
    # end
      
    # def list_destinations_with_index
    #   puts "\nPlease select a destination to get more info:"
    #   get_destination.each.with_index(1) do |item, index|
    #     puts "#{index}. #{item}"
    #     # binding.pry
    #   end
    # end

    # def get_user_destination
    #   chosen_destination = gets.strip.to_i
    #   more_info_for(chosen_destination) if valid_input(chosen_destination, @destinations)
    # end

    # def valid_input(input, data)
    #   input.to_i <= data.length && input.to_i > 0
    # end

    # def more_info_for(chosen_destination)
    #   destination = @destinations[chosen_destination - 1]
    #   puts "Here is more info for #{destination}:"
    #   ##To implement
    #   # TravelLeisure::Destination.all.each.with_index(1) do | destination |
    #   #   puts destination.name
    #   # end
    #   # get_user_destination
    # end

end