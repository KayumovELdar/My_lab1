require_relative 'wagon'

class WagonPassenger < Wagon
  FREE_SEAT="свободное место"
  RESERV_SEAT="зарезервираванное_место"

  def initialize(name,seats)
    @name=name
    @seats=seats
    @seats_list={}
    validate!
    create_seats
  end

  def type
    :passenger
  end

  def create_seats
    for i in @seats
      @seats_list[i]=FREE_SEAT
    end
  end

  def seat_reserv(number)
    @seats_list[number]=RESERV_SEAT
  end

  def list_free
    free_list=@seats_list.filter{|i| n[i]==FREE_SEAT; }
    return free_list.lenght
  end

  def list_reserv
    reserv_list=@seats_list.filter{|i| n[i]==RESERV_SEAT; }
    return reserv_list.lenght
  end

  def valid?
    validate!
    true
  rescue
    false # возвращаем false, если было исключение
  end

  def validate!
      raise "Введено пустое значение" if @name.nil?
      raise "число вагонов не может быть отрицательным" if @seats < 0
  end

end
