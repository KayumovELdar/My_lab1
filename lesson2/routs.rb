class Route
  attr_reader :station, :start_station, :finish_station

  def initialize(start_station, finish_station) # начало и конец маршрута
    @start_station = start_station
    @finish_station = finish_station
    @station = [@start_station, @finish_station]
  end

  def intermediate_station(station)
    @station.insert(-2, station)
  end

  def delete_station(station)
    @station.delete(station)
  end

  private

  attr_writer :station, :start_station, :finish_station
end
