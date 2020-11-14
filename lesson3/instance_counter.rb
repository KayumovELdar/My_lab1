module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_writer :number_class
    def instances
      @number_class
    end
  end

  module InstanceMethods
    @@number=0
    def register_instance
      @@number+=1
      self.class.number_class=@@number
    end
  end
end

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

r1=Route.new(1,2)
r2=Route.new(1,2)
r3=Route.new(1,2)
r4=Route.new(1,2)
r4=Route.new(1,2)
puts Route.instances
puts Route.instances
