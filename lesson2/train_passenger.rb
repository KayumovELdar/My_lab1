require_relative 'train'
require_relative 'wagon_passenger'

class TrainPassenger < Train
  def initialize
    :passenger
  end
end
