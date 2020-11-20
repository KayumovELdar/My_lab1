# frozen_string_literal: true

require_relative 'wagon'

class WagonPassenger < Wagon
  def initialize(name, seats)
    @name = name
    @seats = seats
    @seats_list = seats
    validate!
  end

  def type
    :passenger
  end

  def seat_reserv(_number)
    @seats_list -= 1
  end

  def list_free
    @seats_list
  end

  def list_reserv
    @seats - @seats_list
  end

  def validate!
    raise 'Введено пустое значение' if @name.nil?
    raise 'число вагонов не может быть отрицательным' if @seats.negative?
  end
end
