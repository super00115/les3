
class Train
  attr_reader :number, :type, :size, :speed, :route

  def initialize(number, type, size)
    @number = number
    @type = type
    @size = size
    @speed = 0
  end

  def number
    @number
  end

  def passenger?
    type == :passenger
  end

  def cargo?
    type == :cargo
  end

  def eql?(other)
    number == other.number
 end

  def speedup!(speed = 1)
    @speed += speed
  end

  def stop!
    @speed = 0
  end

  def attach_carriage!
    @size += 1 if speed.zero?
  end

  def detach_carriage!
    @size -= 1 if speed.zero? && size > 1
  end

  def add_route(route)
    @route = route
    route.stations.each { |station| station.departure(self) }
    route.start.arrival(self)
  end

  def get_current_station
    return unless route

    route.stations.find do |station|
      station.include?(self)
    end
  end

  def get_next_station
    return unless route
    route.stations[current_station_index + 1]
  end

  def get_prev_station
    return unless route

    index = current_station_index
    route.stations[index - 1] if index > 0
  end

  def go_next_station!
    next_station = get_next_station()

    if next_station
      get_current_station.departure(self)
      next_station.arrival(self)
    end
  end

  def go_prev_station!
    prev_station = get_prev_station()

    if prev_station
      get_current_station.departure(self)
      prev_station.arrival(self)
    end
  end

  alias == eql?

  private

  def current_station_index
    return unless route

    route.stations.find_index do |station|
      station.include?(self)
    end
  end
end
