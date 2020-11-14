module Manufacturer
  attr_reader :name_manufactur

  def name_manufacturer
    puts "введите имя производителя:"
    @name_manufactur=gets.chomp
  end
end
