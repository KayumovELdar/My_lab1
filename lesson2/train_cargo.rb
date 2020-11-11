require_relative 'train.rb'
require_relative 'wagon_cargo.rb'

class TrainCargo < Train
  def initialize
    :cargo
  end
end
