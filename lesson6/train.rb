# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'modules'
require_relative 'validate'

class Train
  attr_reader :number, :type, :wagon_list

  validation :number, :format,  /^[0-9a-zA-Z]{3}(_+\d{2})*/
  validation :number, :presence, _
  
  include InstanceCounter
  include Manufacturer
  include Validation
  @@train_list = []

  def self.find(number_train)
    @@train_list.filter { |train| train.number == number_train }
  end

  def initialize(number)
    @number = number
    @speed = 0
    @@train_list << self
    @wagon_list = []
    register_instance
    validate!
  end

  def on_wagon(&block)
    @wagon_list.each(&block)
  end

  def speed_change(num)
    @speed += num
    @speed = 0 if @speed.negative?
  end

  def wagon_sum(wagon)
    @wagon_list << wagon if speed.zero? && type == wagon.type
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
