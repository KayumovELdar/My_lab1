require_relative 'instance_counter'

class Route
  attr_reader :station_list, :start_station, :finish_station
  include InstanceCounter
  def initialize(start_station, finish_station) # начало и конец маршрута
    @start_station = start_station
    @finish_station = finish_station
    @station_list = [@start_station, @finish_station]
    register_instance
  end

  def intermediate_station(station)
    @station_list.insert(-2, station)
  end

  def delete_station(station)
    @station_list.delete(station)
  end
end
