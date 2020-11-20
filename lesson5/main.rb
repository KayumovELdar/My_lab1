# frozen_string_literal: true

require_relative 'train'
require_relative 'station'
require_relative 'routs'
require_relative 'train_cargo'
require_relative 'train'
require_relative 'train_passenger'
require_relative 'wagon'
require_relative 'wagon_passenger'
class Main
  def initialize
    @train = {}
    @stations = {}
    @routs = {}
    @wagon = {}
  end

  def menu
    print "1. Ввод станции \n"\
    "2. Ввод подезда\n"\
    "3. Составления маршрута\n"\
    "4. Меню управления поездом\n"\
    "5. Просмотр списка станций или поездов на станции\n"\
    "6. конец программы\n"\
    "\n"\
    "Введите ключ\n"
    loop do
      print "Главное меню\n"\
      'namber_key ='
      namber_key = gets.chomp.to_i
      case namber_key
      when 1 then create_station
      when 2 then create_trains
      when 3 then create_routs
      when 4 then menu_train
      when 5 then list
      when 6 then break
      else
        puts 'данного ключа не сушествует'
      end
    end
  end

  def menu_train
    puts 'введите поезд'
    @train_name = gets.chomp
    check_name(@train_name)

    print "1. Назначить маршрут для поезда\n"\
    "2. Добавление вагона к поезду\n"\
    "3. Отцепка вагона от поезда\n"\
    "4. Перемещение поезда по маршруту\n"\
    "5. конец программы\n"\
    "\n"\
    "Введите ключ\n"
    loop do
      print "меню поезда\n"\
      'namber_key ='
      namber_key = gets.chomp.to_i
      case namber_key
      when 1 then routs_for_train
      when 2 then wagon_for_train
      when 3 then delete_wagon
      when 4 then train_start
      when 5 then break
      else
        puts 'данного ключа не сушествует'
      end
    end
  end

  def create_station
    puts 'введите имя станции'
    name = gets.chomp
    @stations[name] = Station.new(name)
    puts @stations[name]
  end

  def create_trains
    puts 'введите имя поезда'
    name = gets.chomp
    print "1. создать пасажирский поезд\n"\
    "2. создать грузовой поезд \n"\

    print 'namber_key ='
    namber_key = gets.chomp.to_i
    case namber_key
    when 1 then @train[name] = TrainPassenger.new(name)
    when 2 then @train[name] = TrainCargo.new(name)
    else
      print 'данного ключа не существует'
    end
  end

  def create_wagon
    puts 'введите имя вагона'
    name = gets.chomp
    puts 'введите объем вагона или число мест'
    arg = gets.chomp
    print "1. создать пасажирский вагон\n"\
    "2. создать грузовой вагон \n"\

    print 'namber_key ='
    namber_key = gets.chomp.to_i
    case namber_key
    when 1 then @wagon[name] = WagonPassenger.new(name, arg)
    when 2 then @wagon[name] = WagonCargo.new(name, arg)
    else
      print 'данного ключа не существует'
    end
  end

  def create_routs
    puts 'введите маршрута'
    name = gets.chomp
    puts 'введите начальную станцию'
    start = gets.chomp
    puts @stations[start]

    puts 'введите конечную станцию'
    finish = gets.chomp
    puts @stations[finish]
    @routs[name] = Route.new(@stations[start], @stations[finish])
  end

  def routs_for_train
    puts 'введите маршрут'
    name_r = gets.chomp
    check_name(name_r)
    @train[@train_name].train_route(@routs[name_r].station_list)
  end

  def wagon_for_train
    puts @train[@train_name].type
    case @train[@train_name].type
    when :passenger
      @trains[@train_name].wagon_sum(WagonPassenger.new)
    when :cargo
      @trains[@train_name].wagon_sum(WagonCargo.new)
    else
      puts 'данного ключа не существует'
    end
  end

  def delete_wagon(name_t)
    @trains[name_t].wagon_del
  end

  def train_start(name_t)
    print "1. перемещение вперед \n"\
    "2. перемещение назад\n"\

    print 'namber_key ='
    namber_key = gets.chomp.to_i
    case namber_key
    when 1 then @train[name_t].train_up
    when 2 then @train[name_t].train_down
    else
      puts 'неверный ключ'
    end
  end

  def list
    print "1 вывести список всех поездов\n"\
    "2 вывести список всех станций\n"\
    "3 вывести список всех маршрутов\n"\

    print 'namber_key ='
    namber_key = gets.chomp.to_i
    case namber_key
    when 1 then @train.each { |x| puts x }
    when 2 then @stations.each { |x| puts x }
    when 3 then @routs.each { |x| puts x }
    else
      puts 'неверный ключ'
    end
  end
end

man = Main.new
man.menu
