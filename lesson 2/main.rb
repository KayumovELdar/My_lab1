require_relative 'train'
require_relative 'station'
require_relative 'routs'
print "1. Ввод станции \n"\
"2. Ввод подезда\n"\
"3. Составления маршрута\n"\
"4. Назначить маршрут для поезда\n"\
"5. Добавление вагона к поезду\n"\
"6. Отцепка вагона от поезда\n"\
"7. Перемещение поезда по маршруту\n"\
"8. Просмотр списка станций или поездов на станции\n"\
"9. конец программы\n"\
"\n"\
"Введите ключ\n"

=begin
class Maincc

  def initialize
    @train={}
    @station={}
    @routs={}
  end

  def start_cycle
    #while @namber_key !=9
      print "1. Ввод станции \n"\
      "2. Ввод подезда\n"\
      "3. Составления маршрута\n"\
      "4. Назначить маршрут для поезда\n"\
      "5. Добавление вагона к поезду\n"\
      "6. Отцепка вагона от поезда\n"\
      "7. Перемещение поезда по маршруту\n"\
      "8. Просмотр списка станций или поездов на станции\n"\
      "9. конец программы\n"\
      "\n"\
      "Введите ключ\n"
      namber_key = 1
      case namber_key
        when 1 then create_train
      end
    #end
  end




    def create_train
      puts "введите имя поезда"
      train_name=
      return "пустое значение или данный поез уже существует" if train_name.nil? || @train.include?(train_name)
      @train[train_name]=Train.new(train_name,0,0)
    end
end

main =Maincc.new
main.start_cycle
print ro
=end
