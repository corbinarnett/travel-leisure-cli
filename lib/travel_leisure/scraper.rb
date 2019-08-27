class TravelLeisure::Scraper
  def self.scrape_destinations
    doc = Nokogiri::HTML(open("https://www.travelandleisure.com/travel-guide"))
    # binding.pry
  end

    # def get_page
    #   Nokogiri::HTML(open("https://www.travelandleisure.com/travel-guide"))
    #   binding.pry
    # end


  
    
  
end