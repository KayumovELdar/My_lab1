# frozen_string_literal: true

module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def instances
      @number_class ||= 0
    end

    def increase_instance_counter
      instances
      @number_class += 1
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.increase_instance_counter
    end
  end
end
