class TravelLeisure::Scraper
  def get_page
    Nokogiri::HTML(open("https://www.travelandleisure.com/travel-guide"))
  end

  def scrape_destinations
    self.get_page.css("ul.grid li")
  end

  def make_destinations
    scrape_destinations.each do |r|
      TravelLeisure::Destination.new_from_website(r)
    end
  end
end