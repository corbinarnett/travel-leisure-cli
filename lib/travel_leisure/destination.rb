class TravelLeisure::Destination
  @@all = []
  attr_accessor :city, :country, :url

  def self.new_from_index_page(r)
    self.new(
      r.css("span.grid__item__title").text,
      r.css("span.grid__item__cat").text,
      r.css("a").attribute("href").text
      )
  end

  def initialize(city=nil,country=nil,url=nil)
    @city = city
    @country = country
    @url = url
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end