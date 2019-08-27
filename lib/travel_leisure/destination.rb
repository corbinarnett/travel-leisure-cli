class TravelLeisure::Destination
  @@all = []
  attr_accessor :city, :country

  def initialize(city, country)
    @city = city
    @country = country
    save
  end

  def self.all
    TravelLeisure::Scraper.create_destinations if @@all.empty?
    @@all
  end

  def save
    @@all << self
  end
end