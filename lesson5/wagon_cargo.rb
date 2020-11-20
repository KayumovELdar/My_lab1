# frozen_string_literal: true

require_relative 'wagon'

class WagonCargo < Wagon
  def initialize(name, volume)
    @name = name
    @volume = volume
    @volume_reserv = 0
    validate!
  end

  def type
    :cargo
  end

  def take_volume(volume)
    @volume_reserv += volume
    validate!
  end

  def reserv
    @volume_reserv
  end

  def free
    @volume - @volume_reserv
  end

  def validate!
    raise 'Введено пустое значение' if @name.nil?
    raise 'объем не может быть отрицательным' if @volume.negative?
    raise 'перегруз' if @volume < @volume_reserv
  end
end
