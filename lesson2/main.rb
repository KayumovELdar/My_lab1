require_relative 'train.rb'
require_relative 'station.rb'
require_relative 'routs.rb'
class Main

  def initialize
    @train={}
    @station={}
    @routs={}
  end

  def menu
    @run_1=true
    print "1. Ввод станции \n"\
    "2. Ввод подезда\n"\
    "3. Составления маршрута\n"\
    "4. Меню управления поездом\n"\
    "5. Просмотр списка станций или поездов на станции\n"\
    "6. конец программы\n"\
    "\n"\
    "Введите ключ\n"
    while @run_1
      print "namber_key ="
      namber_key =gets.chomp
      case namber_key
      when 1 then create_station
      when 2 then cteate_train
      when 3 then create_routs
      when 4 then menu_train
      when 5 then list
      when 6 then @run_1=false
      else
        puts "данного ключа не сушествует"
      end
    end
  end

  def menu_train
    puts "введите поезд"
    name_t = gets.chomp
    check_name(name_t)

    print   "1. Назначить маршрут для поезда\n"\
    "2. Добавление вагона к поезду\n"\
    "3. Отцепка вагона от поезда\n"\
    "4. Перемещение поезда по маршруту\n"\
    "5. конец программы\n"\
    "\n"\
    "Введите ключ\n"
    while @run_2
      print "namber_key ="
      namber_key =gets.chomp
      case namber_key
      when 1 then routs_for_train
      when 2 then wagon_for_train
      when 3 then delete_wagon
      when 4 then train_start
      when 5 then @run_2=false
      else
        puts "данного ключа не сушествует"
      end
    end
  end

  def create_station
    puts "введите имя станции"
    name = gets.chomp
    check_name(name)
    include_name(name,st)
    @station[name]=Station.new(name)
  end

  def create_train
    puts "введите имя поезда"
    name = gets.chomp
    check_name(name)
    include_name(name,st)
    print "1. создать грузовой поезд \n"\
    "2. создать пасажирский поезд\n"\

    print "namber_key ="
    namber_key = gets.chomp
    case namber_key
    when 1 then @train[name]=TrainPassenger.new(name)
    when 2 then @train[name]=TrainCargo.new(name)
    else
      print "данного ключа не существует"
    end
  end

  def create_routs
    puts "введите маршрута"
    name = gets.chomp
    check_name(name)
    include_name(name,st)
    puts "введите начальную станцию"
    start = gets.chomp
    check_name(name)
    include_name(name,st)
    puts "введите конечную станцию"
    finish = gets.chomp
    check_name(name)
    include_name(name,st)
    @routs[name]=Routs.new(start,finish)
  end

  def routs_for_train(name_t)
    puts "введите маршрут"
    name_r = gets.chomp
    check_name(name_r)
    @train[name_t].train_route=@routs[name_r].station
  end

  def wagon_for_train(name_t)
    case @train[name_t].class
    when :TrainPassenger
      @trains[args[0]].add_wagon(WagonPassenger.new)
    when :TrainCargo
      @trains[args[0]].add_wagon(WagonCargo.new)
    else
      puts "данного ключа не существует"
    end

  end

  def delete_wagon(name_t)
    @trains[name_t].wagon_del
  end

  def train_start(name_t)
    print "1. перемещение вперед \n"\
    "2. перемещение назад\n"\

    print "namber_key ="
    namber_key = gets.chomp
    case namber_key
    when 1 then @train[name_t].train_up
    when 2 then @train[name_t].train_down
    else
      puts "неверный ключ"
    end
  end

  def list
    print "1 вывести список всех поездов\n"\
    "2 вывести список всех станций\n"\
    "3 вывести список всех маршрутов\n"\
    
    print "namber_key ="
    namber_key = gets.chomp
    case namber_key
    when 1 then @train.each { |x| return x }
    when 2 then @station.each { |x| return x }
    when 3 then @routs.each { |x| return x }
    else
      puts "неверный ключ"
    end
  end

  def check_name(name)
    return puts "значение пустое"  if name==nil
  end

  def include_name(name,st)
    return puts "значение #{name} существует"  if st.include? name1
  end
end
