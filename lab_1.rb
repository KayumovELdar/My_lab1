class Route
  attr_reader :route

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
    #@route.each { |station| print station.name }
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
    if @speed.zero? && @wagon > 0
        @wagon -= 1
    end
  end

  def train_route(route)
    @route = route
    @number_station = 0
    #puts @route.route[@number_station].name
    @route.route[@number_station].add_train(self)
  end

  def train_up
    if @number_station < (@route.route.length - 1)
      @route.route[@number_station].remove_train(self)
      @number_station += 1
      @route.route[@number_station].add_train(self)
    end
  end

  def train_down # перемещение назад
    if @number_station > 0
      @route.route[@number_station].remove_train(self)
      @number_station -= 1
      @route.route[@number_station].add_train(self)
    end
  end

  def next_station
    if (@number_station + 1) < @route.route.length
      return @route.route[@number_station + 1]
    end
  end

  def previous_station
    if (@number_station - 1) >= 0
      return @route.route[@number_station - 1]
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
    #@station_trains.each { |name| puts name.number  }
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
    #train_list.each {|train| puts train.mode}
    #puts number
    train_list.each {|train| return train}
    return number
  end
end

=begin
train11=Train.new("111","g",10)
train12=Train.new("222","r",10)
train13=Train.new("333","g",10)
train14=Train.new("444","r",10)
station1=Station.new("st1")
station2=Station.new("st2")
station3=Station.new("st3")
station4=Station.new("st4")
station5=Station.new("st5")
station6=Station.new("st6")
route1=Route.new(station1,station6)
route1.intermediate_station(station3)
route1.intermediate_station(station5)
route1.list_station
train11.train_route(route1)
train12.train_route(route1)
train13.train_route(route1)
train14.train_route(route1)
station1.list_train
station1.list_train_type("g")
train11.train_up
train14.train_up
station1.list_train
station1.list_train_type("g")
station3.list_train
station3.list_train_type("g")
=end
