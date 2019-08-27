class TravelLeisure::Destination
  @@all = []
  attr_accessor :city, :country, :url

  def self.new_from_destination_page(r)
    self.new(
      r.css("span.grid__item__title").text,
      r.css("span.grid__item__cat").text,
      "https://www.travelandleisure.com/travel-guide/#{r.css("span.grid__item__title").text.downcase}"
      )
  end

  def initialize(city=nil,country=nil,url=nil)
    @city = city
    @country = country
    @url = url
    @@all << self
  end

  def self.all
    @@all
    # binding.pry
  end

  def self.find(id)
    self.all[id-1]
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end



end