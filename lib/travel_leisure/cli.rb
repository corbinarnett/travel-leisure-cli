# code handling CLI display logic and user input
class TravelLeisure::CLI #:: name space
    def call
      puts "Welcome to Command Line Travel Guides!"
      #list_destinations
      # get_user_destination
      #display_destination_info(user_input)
    end
      
    def list_destinations_with_index
      #to be scraped instead
      @destinations = ["Amsterdam, Netherlands", "Bali, Thailand", "Austin, Texas"] #@destinations is an instance variable
      
      @destinations.each_with_index do |item, index|
        puts "#{index}. #{item}"
      end
      
      
    end

end