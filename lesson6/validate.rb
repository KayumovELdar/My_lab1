
module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods

    def validation(*names, type, args)
      h=instance_variable_get('@type_list') || []
      names.each do |name|
      instance_variable_set('@type_list',h << [type, name,args])
      end
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
      self.class.instance_variable_get('@type_list').each do |type, name,args|
        @name=name
        @args=args
        #puts "#{type} #{name} #{args}"
        send"validate_#{type}".to_sym
      end
  end

      private

      def validate_type
        raise 'не соответствие заявленному типу' unless @name.is_a?(@args)
      end

      def validate_format
        raise "#{@name} не соответствует формату" if @name !~ @args
      end

      def validate_presence
        raise"#{@name} пустое значение" if @name==nil || @name==""
      end
  end
end

class Test
  include Validation
  validation "CCC", :presence, String
  validation "ZZZ", :format, /^[0-9a-zA-Z]{3}(_+\d{2})*/
  validation "CCA", :type, String
  def initialize
    validate!
  end
end

t=Test.new
