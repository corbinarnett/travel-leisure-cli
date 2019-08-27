class TravelLeisure::Destination
  @@all = []
  attr_accessor :name

  def initialize(name)
    @name = name
    save
  end

  def self.all
    TravelLeisure::Scraper.scrape_destinations if @@all.empty?
    @@all
  end

  def save
    @@all << self
  end
end