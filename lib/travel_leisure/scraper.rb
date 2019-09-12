class TravelLeisure::Scraper

  def self.get_page
    Nokogiri::HTML(open("https://www.travelandleisure.com/travel-guide"))
  end

  def self.scrape_destinations
    destinations = get_page.css("ul.grid li")
    destinations.collect do |destination|
      destination_hash = {
        city: destination.css("span.grid__item__title").text,
        country: destination.css("span.grid__item__cat").text,
        url: destination.css("a").attribute("href")
      }
    end
  end
end