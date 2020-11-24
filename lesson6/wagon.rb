# frozen_string_literal: true

require_relative 'modules'

class Wagon
  include Manufacturer

  def valid?
    validate!
    true
  rescue StandardError
    false # возвращаем false, если было исключение
  end
end
