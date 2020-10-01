class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = {}
  end

  def arrival(train)
    trains[train.number] = train unless include?(train)
  end

  def departure(train)
    trains.delete(train.number)
  end

  def include?(train)
    trains.key?(train.number)
  end

  def all_trains
    trains.values
  end

  def cargo_trains
    trains.values.select(&:cargo?)
  end

  def passenger_trains
    trains.values.select(&:passenger?)
  end
end
