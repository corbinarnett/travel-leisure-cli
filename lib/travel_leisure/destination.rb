class TravelLeisure::Destination
  @@all = []
  attr_accessor :city, :country, :url, :best_time_to_visit, :transportation, :weather, :know_before_visiting, :language, :currency, :description

  def initialize(destination_hash)
    @city = destination_hash[:city]
    @country = destination_hash[:country]
    @url = destination_hash[:url]
    save
  end

  def self.make_from_collection(collection)
    collection.each do |destination_hash|
      self.new(destination_hash)
    end
  end

  def self.load
    self.make_from_collection(TravelLeisure::Scraper.scrape_destinations)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find(index)
    self.all[index-1]
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  def best_time_to_visit
    @best_time_to_visit ||= doc.css("div.article-tips__item")[0].css("p.article-tips__content").text
  end

  def transportation
    @transportation ||= doc.css("div.article-tips__item")[1].css("p.article-tips__content").text
  end

  def weather
    @weather ||= doc.css("div.article-tips__item")[2].css("p.article-tips__content").text
  end

  def know_before_visiting
    @know_before_visiting ||= doc.css("div.article-tips__item")[3].css("p.article-tips__content").text.strip
  end

  def language
    @language ||= doc.css("div.article-tips__item")[4].css("p.article-tips__content").text.strip
  end

  def currency
    @currency ||= doc.css("div.article-tips__item")[6].css("p.article-tips__content").text
  end

  def description
    @description ||= doc.css("div.destination-page-header__copy--full p").text
  end


end