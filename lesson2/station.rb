class Station
  attr_reader :train

  def initialize(train)
    @train = train
    @station_trains = []
  end

  def add_train(train)
    @station_trains += [train]
  end

  def remove_train(train)
    @station_trains -= [train]
  end

  def list_train
    @station_trains.each { |train| return train }
  end

  def list_train_type(type_train)
    @station_trains.filter { |train| train.type == type_train }
  end
end
