require_relative 'instance_counter'
require_relative 'modules'

class Train
  attr_reader :number, :type, :wagon_list
  include InstanceCounter
  include Manufacturer
  def initialize(number)
    @number = number
    @speed = 0
    register_instance
    d
    d
  end

  def speed_change(num)
    @speed += num
    @speed = 0 if @speed.negative?
  end

  def wagon_sum(wagon)
    @wagon_list << wagon if speed.zero? && self.type==wagon.type
  end

  def wagon_del
    @wagon_list.pop if speed.zero?
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

  private

  attr_writer :number, :type, :wagon_list

  def next_station
    return @current_station if @current_station == @route.finish_station

    @route.station[@route.station.index(@current_station) + 1]
  end

  def previous_station
    return @current_station if @current_station == @route.start_station

    @route.station[@route.station.index(@current_station) - 1]
  end
end
