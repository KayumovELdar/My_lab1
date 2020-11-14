module InstanceCounter

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_writer :number_class
    def instances
      @number_class
    end
  end

  module InstanceMethods
    private
    @@number=0
    def register_instance
      @@number+=1
      self.class.number_class=@@number
    end
  end
end
