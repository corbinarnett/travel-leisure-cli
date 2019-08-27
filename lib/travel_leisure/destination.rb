class TravelLeisure::Destination
  @@all = ["a", "b", "c"]
  attr_accessor :place

  def initialize(place)
    @place = place
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end
end