class TravelLeisure::Scraper
  def get_page
    Nokogiri::HTML(open("https://www.travelandleisure.com/travel-guide"))
  end

  def scrape_cities
    self.get_page.css("span.grid__item__title")
  end

  def scrape_countries
    self.get_page.css("span.grid__item__cat")
    binding.pry
  end
end