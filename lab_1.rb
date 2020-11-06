# frozen_string_literal: true

class Route
  attr_reader :route

  # выводим всесь маршрут для прикрепления к поезду
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

  def result
    @route.each { |train| return train.name }
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
    puts @speed
    @speed
  end

  def wagon_sum # повышаем число вагонов
    if @speed.zero?
      @wagon += 1
      puts @wagon
      @wagon
    else
      puts 'Поезд на ходу!!! сбавьте скорость до 0!!!'
    end
  end

  def wagon_del # понижаем число вагонов
    if @speed.zero?
      @wagon -= 1
      puts @wagon
      @wagon
    else
      puts 'Поезд на ходу!!! сбавьте скорость до 0!!!'
    end
  end

  def train_route(route)
    puts 'Маршрут передан' # передаем данные о маршруте
    @route = route
    @number_station = 0
    @route.each { |x| puts " #{x.name}" }
    puts @route.length.to_s
  end

  def train_up # перемещение вперед НЕ УЧИТЫВАЛОСЬ ЧТО ЗНАЧЕНИЕ ПРИВЫСИТ ПОРОГ
    if @number_station == (@route.length - 1)
      puts 'дальше ехать вы не можете'
    else
      @number_station += 1
      puts 'вы прибыли в конечную точку маршрута' if @number_station == (@route.length - 1)
    end
    @route[@number_station].name
  end

  def train_down # перемещение назад
    if @number_station.zero?
      puts 'назад ехать вы не можете'
    else
      @number_station -= 1
      puts 'вы прибыли в начальную точку маршрута' if @number_station.zero?
    end
    @route[@number_station].name
  end

  def next_station
    if (@number_station + 1) < @route.length
      @route[@number_station + 1].name
    else
      'следующей станции нет!'
    end
  end

  def previous_station
    if (@number_station - 1) >= 0
      @route[@number_station - 1].name
    else
      'предыдущей станции нет!'
    end
  end
end

class Station
  attr_reader :name

  def initialize(name)
    @name = name
    @stationTrains = []
  end

  def staying_train(name)
    @stationTrains += [name]
  end

  def waning_train(name)
    @stationTrains -= [name]
  end

  def result
    @stationTrains.each { |name| puts "Номер поезда- № #{name.number}. Тип поезда - #{name.mode}  ." }
  end
end

 train111=Train.new("111","грузовой",30)
 train112=Train.new("112","пасажирский",30)
 train113=Train.new("113","грузовой",30)
 train114=Train.new("114","пасажирский",30)
 station111=Station.new("Станция 1")
 station222=Station.new("Станция 2")
 station333=Station.new("Станция 3")
 station444=Station.new("Станция 4")
 station555=Station.new("Станция 5")
 station666=Station.new("Станция 6") # ЧТО ДОЛЖНО БЫТЬ ТУТ ВМЕСТО ИМЕНИ ПОЕЗДА ???# station111.staying_train(train111)# station111.staying_train(train112)# station111.staying_train(train113)
 station111.staying_train(train114)
 station111.result# route1=Route.new(station111,station666)# route1.intermediate_station(station333)
 route1.intermediate_station(station444)
 route1.delete_station(station333)

 train111.train_route(route1.route)
 train111.train_up
 train111.train_up
 train111.train_down
