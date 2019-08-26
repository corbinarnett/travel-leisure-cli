class TravelLeisure::Scraper
  

    def get_page
      Nokogiri::HTML(open("https://www.travelandleisure.com/travel-guide"))
      binding.pry
    end


  
    
  
end