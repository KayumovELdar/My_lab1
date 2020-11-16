require_relative 'instance_counter'

class Route
  attr_reader :station_list, :start_station, :finish_station

  include InstanceCounter
  def initialize(start_station, finish_station) # начало и конец маршрута
    @start_station = start_station
    @finish_station = finish_station
    @station_list = [@start_station, @finish_station]
    validate!
    register_instance
  end

  def valid?
    validate!
    true
  rescue
    false # возвращаем false, если было исключение
  end

  def validate!
   raise 'Первая станция не соответствует типу Station' if @finish_station.class != :Station
   raise 'Последняя станция не соответствует типу Station' if @start_station.class != :Station
 end

  def intermediate_station(station)
    @station_list.insert(-2, station)
  end

  def delete_station(station)
    @station_list.delete(station)
  end
end
