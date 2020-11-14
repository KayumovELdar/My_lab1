require_relative 'instance_counter'

class Station
  attr_reader :station
  include InstanceCounter
  @@station_list=[]

  def self.all
   @@station_list
  end

  def initialize(station)
    @station = station
    @station_trains = []
     @@stations_list << self
    register_instance
  end

  def add_train(train)
    @station_trains += [train]
  end

  def remove_train(train)
    @station_trains -= [train]
  end

  def list_train
    @station_trains.each { |train| return train }
  end

  def list_train_type(type_train)
    @station_trains.filter { |train| train.type == type_train }
  end
end
