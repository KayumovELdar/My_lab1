# frozen_string_literal: true

require_relative 'train'
require_relative 'wagon_cargo'

class TrainCargo < Train
  def type
    :cargo
  end
end
