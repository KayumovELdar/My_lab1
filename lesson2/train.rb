class Train
  attr_reader :number, :type

  def initialize(number, type, wagon)
    @number = number
    @type = type
    @wagon = wagon
    @speed = 0
  end

  def speed_change(num)
    @speed += num
    @speed = 0 if @speed.negative?
  end

  def wagon_sum
    @wagon += 1 if @speed.zero?
  end

  def wagon_del
    @wagon -= 1 if @speed.zero? && @wagon > 0
  end

  def train_route(route)
    @route = route
    @current_station = route.start_station
    @current_station.add_train(self)
  end

  def train_up
    return if @current_station == @route.finish_station

    @current_station.remove_train(self)
    @current_station = next_station
    @current_station.add_train(self)
  end

  def train_down
    return if @current_station == @route.start_station

    @current_station.remove_train(self)
    @current_station = finish_station
    @current_station.add_train(self)
  end

  def next_station
    return @current_station if @current_station == @route.finish_station

    @route.station[@route.station.index(@current_station) + 1]
  end

  def previous_station
    return @current_station if @current_station == @route.start_station

    @route.station[@route.station.index(@current_station) - 1]
  end
end
