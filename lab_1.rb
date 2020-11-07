class Route
  attr_reader :route


  def initialize(start_station, finish_station) # начало и конец маршрута
    @start_station = start_station
    @finish_station = finish_station
    @route = [@start_station, @finish_station]
  end


  def intermediate_station(name) # добавление станции
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
    if @speed.zero?
      @wagon += 1
    end
  end


  def wagon_del # понижаем число вагонов
    if @speed.zero?
      if @wagon > 0
        @wagon -= 1
      end
    end
  end


  def train_route(route)
    @route = route
    @number_station = 0
  end


  def train_up
    @route[@number_station].waning_train(self)
    if @number_station = (@route.length - 1)
      puts 'дальше ехать вы не можете'
    else
      @number_station += 1
      if @number_station == (@route.length - 1)
        puts 'вы прибыли в конечную точку маршрута'
      end
      @route[@number_station].staying_train(self)
      return @route[@number_station]
    end
  end


  def train_down # перемещение назад
    @route[@number_station].waning_train(self)
    if @number_station.zero?
      puts 'назад ехать вы не можете'
    else
      @number_station -= 1
      if @number_station.zero?
        puts 'вы прибыли в начальную точку маршрута'
      end
      @route[@number_station].staying_train(self)
      return @route[@number_station]
    end
  end


  def next_station
    if (@number_station + 1) < @route.length
      return @route[@number_station + 1]
    end
  end


  def previous_station
    if (@number_station - 1) >= 0
      return @route[@number_station - 1]
    end
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
    @station_trains.each { |name| return name  }
  end


  def list_train_type(type_train)
    number = 0
    train_list =[]
    for x in @station_trains
     if type_train == x.mode
        train_list += [x]
        number += 1
      end
    end
    train_list.each {|train| return train}
    return number
  end
end
