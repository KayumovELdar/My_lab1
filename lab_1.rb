class Route
  attr_reader :route, :start_station, :finish_station

  def initialize(start_station, finish_station) # начало и конец маршрута
    @start_station = start_station
    @finish_station = finish_station
    @route = [@start_station, @finish_station]
  end

  def intermediate_station(name)
    @route.insert(-2, name)
  end

  def delete_station(name) # удаление станции
    @route.delete(name)
  end

  def list_station
    @route.each { |station| return station }
  end
end


class Train
  attr_reader :number, :mode

  def initialize(number, mode, wagon) # номер тип транспорта число вагонов
    @number = number
    @mode = mode
    @wagon = wagon
    @speed = 0
  end

  def speed_change(num) # меняем скорость на любое значение, при отрицательном значение скорость 0
    @speed += num
    @speed = 0 if @speed.negative?
  end

  def wagon_sum # повышаем число вагонов
    @wagon += 1 if @speed.zero?
  end

  def wagon_del # понижаем число вагонов
    @wagon -= 1 if @speed.zero? && @wagon > 0
  end

  def train_route(route)
    @route = route
    @number_station = 0
    @route.route[@number_station].add_train(self)
  end

  def train_up
    @route.route[@number_station].remove_train(self)
    next_station
    @route.route[@number_station].add_train(self)
  end

  def train_down # перемещение назад
    @route.route[@number_station].remove_train(self)
    previous_station
    @route.route[@number_station].add_train(self)
  end

  def next_station
    return @number_station if @route.route[@number_station] == @route.finish_station

    @number_station += 1
  end

  def previous_station
    return @number_station if @route.route[@number_station] == @route.start_station

    @number_station -= 1
  end
end


class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @station_trains = []
  end

  def add_train(name)
    @station_trains += [name]
  end

  def remove_train(name)
    @station_trains -= [name]
  end

  def list_train
    @station_trains.each { |name| return name }
  end

  def list_train_type(type_train)
    number = 0
    train_list = []
    @station_trains.each do |x|
      if type_train == x.mode
        train_list += [x]
        number += 1
      end
    end
    train_list.each { |train| return train }
    number
  end
end
