require_relative 'instance_counter'
require_relative 'modules'

class Train
  attr_reader :number, :type, :wagon_list

  NUMBER_FORMAT = /^[0-9a-zA-Z]{3}(_+\d{2})*/

  include InstanceCounter
  include Manufacturer
  @@train_list = []

  def self.find(number_train)
    @@train_list.filter { |train| train.number == number_train }
  end

  def initialize(number)
    @number = number
    validate!
    @speed = 0
    @@train_list << self
    @wagon_list=[]
    register_instance
  end

  def on_wagon
     @wagon_list.each { |wagon| yield(wagon) }
  end

  def valid?
    validate!
    true
  rescue
    false # возвращаем false, если было исключение
  end

  def validate!
      raise "Введено пустое значение" if number.nil?
      raise "Введено меньше 3 символов " if number.length < 3
      raise "Не соответствие формату xxx_xx" if number !~ NUMBER_FORMAT
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
