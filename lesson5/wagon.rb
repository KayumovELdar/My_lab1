require_relative 'modules'

class Wagon
  include Manufacturer

  def valid?
    validate!
    true
  rescue
    false # возвращаем false, если было исключение
  end
end
