# frozen_string_literal: true

module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validation(*names, type, args)
      h = instance_variable_get('@type_list') || []
      names.each do |name|
        instance_variable_set('@type_list', h << [type, name, args])
      end
    end
  end

  module InstanceMethods
    def valid?
      validate!
      true
    rescue StandardError
      false
    end

    def validate!
      self.class.instance_variable_get('@type_list').each do |type, name, args|

        # puts "#{type} #{name} #{args}"
          send "validate_#{type}".to_sym, name, args
      end
    end

    private

    def validate_type(name, args)
      raise 'не соответствие заявленному типу' unless name.is_a?(args)
    end

    def validate_format(name, args)
      raise "#{name} не соответствует формату" if name !~ args
    end

    def validate_presence(name, args)
      raise "#{name} пустое значение" if name.nil? || name == ''
    end
  end
end
