# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validate'

class Station
  attr_reader :station

  validation :station, :format,  /^[A-Z]/

  include InstanceCounter
  include Validation
  @@station_list = []

  def self.all
    @@station_list
  end

  def initialize(station)
    @station = station
    @station_trains = []
    @@stations_list << self
    validate!
    register_instance
  end

  def on_trains(&block)
    @station_trains.each(&block)
  end

  def valid?
    validate!
    true
  rescue StandardError
    false # возвращаем false, если было исключение
  end

  def validate!
    raise 'Введено пустое значение' if station.nil?
    raise 'Введено меньше 6 символов' if station.length < 6
    raise 'не соответствие формату Xxxxxx' if station !~ STATION_FORMAT
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
