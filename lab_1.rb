class Route


  attr_reader :route0
# выводим всесь маршрут для прикрепления к поезду
  def initialize(start_station, finish_station) # начало и конец маршрута
    @start_station = [start_station]
    @finish_station = [finish_station]
    @route0 = @start_station + @finish_station
    @intermediate_station = []
    @route0.each { |train| puts train.name_station }
    puts " "
  end


  def intermediate_station(name_station) # добавление станции
    @intermediate_station= @intermediate_station + [name_station]
    @route0 = @start_station + @intermediate_station + @finish_station
    @route0.each { |train| puts train.name_station }
    puts " "
  end


  def delete_station(name_station) # удаление станции
    @intermediate_station = @intermediate_station - [name_station]
    @route0 = @start_station + @intermediate_station + @finish_station
    @route0.each { |train| puts train.name_station }
    puts " "
  end

  def conclusion
    @route0.each { |train| puts train.name_station }
    @route0.each { |train| return train.name_station }
  end
end



class Train
  attr_reader :number
  attr_reader :type1
  def initialize(number,type1,wagon) # номер тип транспорта число вагонов
    @number = number
    @type1 = type1
    @wagon = wagon
    @speed=0
      puts ("Я РОДИЛСЯ")
  end


  def speed_change(num) #меняем скорость на любое значение, при отрицательном значение скорость 0
    @speed+= num
      if @speed < 0
        @speed=0

      end
    puts @speed
    return @speed
  end


  def wagon_sum # повышаем число вагонов
    if @speed==0
      @wagon+=1
      puts @wagon
        return @wagon
    else
      puts "Поезд на ходу!!! сбавьте скорость до 0!!!"
    end
  end


  def wagon_del #понижаем число вагонов
    if @speed==0
      @wagon-=1
      puts @wagon
      return @wagon
    else
      puts "Поезд на ходу!!! сбавьте скорость до 0!!!"
    end
  end


  def train_route (route)
    puts "Маршрут передан"# передаем данные о маршруте
    @train_r=route
    @n=0
    @train_r.each { |xxx| puts " #{xxx.name_station}"}
    puts "#{@train_r.length}"
  end


  def train_up #перемещение вперед НЕ УЧИТЫВАЛОСЬ ЧТО ЗНАЧЕНИЕ ПРИВЫСИТ ПОРОГ
    @n+=1
    puts "перемещение на станцию - #{@train_r[@n].name_station}"
    puts " "
    if @n>0
      puts "предыдущая #{@train_r[@n-1].name_station}"
    end
      puts "текущая #{@train_r[@n].name_station}"
    if (@n+1)<@train_r.length
      puts "следующая #{@train_r[@n+1].name_station}"
    end
    puts " "
  end

  def train_down #перемещение назад
    @n-=1
    puts "перемещение на станцию - #{@train_r[@n].name_station}"
    puts " "
    if @n>0
      puts "предыдущая #{@train_r[@n-1].name_station}"
    end
    puts "текущая #{@train_r[@n].name_station}"
    if @n<@train_r.length
      puts "следующая #{@train_r[@n+1].name_station}"
    end
    puts " "
  end
end


class Station
  attr_reader :name_station
  def initialize(name)
    @name_station = name
    @stationTrains = []
  end


  def staying_train(name)
    @stationTrains += [name]
  end


  def waning_train(name)
    @stationTrains -= [name]
  end


  def result
    @stationTrains.each { |name| puts "Номер поезда- № #{name.number}. Тип поезда - #{name.type1}  ." }
  end
end
=begin
train111=Train.new("111","грузовой",30)
train112=Train.new("112","пасажирский",30)
train113=Train.new("113","грузовой",30)
train114=Train.new("114","пасажирский",30)
station111=Station.new("Станция 1")
station222=Station.new("Станция 2")
station333=Station.new("Станция 3")
station444=Station.new("Станция 4")
station555=Station.new("Станция 5")
station666=Station.new("Станция 6") # ЧТО ДОЛЖНО БЫТЬ ТУТ ВМЕСТО ИМЕНИ ПОЕЗДА ???
station111.staying_train(train111)
station111.staying_train(train112)
station111.staying_train(train113)
station111.staying_train(train114)
station111.result
route1=Route.new(station111,station666)
route1.intermediate_station(station333)
route1.intermediate_station(station444)
route1.delete_station(station333)

train111.train_route(route1.route0)
train111.train_up
train111.train_up
train111.train_down
=end
