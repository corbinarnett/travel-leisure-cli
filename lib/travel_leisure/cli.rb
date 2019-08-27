# code handling CLI display logic and user input
class TravelLeisure::CLI #:: name space
    def call
      puts "Welcome to Command Line Travel Guides!"
      get_destinations
      list_destinations_with_index
      # get_user_destination
      #display_destination_info(user_input)
    end

    def get_destinations
      #to be scraped instead  
      @destinations = ["Amsterdam, Netherlands", "Bali, Thailand", "Austin, Texas"] #@destinations is an instance variable
    end
      
    def list_destinations_with_index
      @destinations.each.with_index(1) do |item, index|
        puts "#{index}. #{item}"
      end
    end

end