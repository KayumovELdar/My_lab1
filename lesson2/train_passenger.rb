require_relative 'train.rb'
require_relative 'wagon_passenger.rb'

class TrainPassenger < Train
  def initialize
    :passenger
  end
end
