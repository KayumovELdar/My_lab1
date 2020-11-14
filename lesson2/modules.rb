module Manufacturer
  arrt_reader :name_manufactur

  def name_manufacturer
    puts "введите имя производителя:"
    @name_manufactur=gets.chomp
  end
end
