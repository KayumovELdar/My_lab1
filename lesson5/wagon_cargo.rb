require_relative 'wagon'

class WagonCargo < Wagon

  def initialize(name,volume)
    @name=name
    @volume=volume
    @volume_reserv=0
    validate!
  end

  def type
    :cargo
  end

  def take_volume(volume)
    @volume_reserv+=volume
    validate!

  end

  def reserv
      @volume_reserv
  end

  def free
      @volume-@volume_reserv
  end

  def valid?
    validate!
    true
  rescue
    false # возвращаем false, если было исключение
  end

  def validate!
      raise "Введено пустое значение" if @name.nil?
      raise "объем не может быть отрицательным" if @volume < 0
      raise "перегруз" if @volume < @volume_reserv
  end
end


def call_block
  yield('hello', 99)
end
call_block {|str, num| puts str + ' ' + num.to_s}
