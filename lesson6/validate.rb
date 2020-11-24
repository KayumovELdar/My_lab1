
module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def validation(name, type, arg)
      @name=name
      @type=type
      @arg=arg
      send "validation_#{type}".to_sym
    end
    def validate_type
       raise 'не соответствие заявленному типу' unless @name.is_a?(@arg)
    end

    def validate_format
     raise "#{@name} не соответствует формату" if @name !~ @arg
    end

    def validate_presence
       raise"#{@name} пустое значение" unless @name==nil || @name==""
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue
      false
    end

    def validate!
      self.class.validation(name, type, arg)
    end
  end
end
