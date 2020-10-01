class Route
  attr_reader :start, :finish

  def initialize(start, finish)
    @start = start
    @finish = finish
  end

  def add(station)
    stops << station
  end

  def remove(station)
    stops.delete(station)
  end

  def stations
    [start, *stops, finish]
  end

  private

  def stops
    @stops ||= []
  end
end
