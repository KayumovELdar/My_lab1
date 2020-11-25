# frozen_string_literal: true

module Accessors
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def attr_accessor_with_history(*names)
      names.each do |name|
        var_name = "@#{name}".to_sym
        define_method(name) { instance_variable_get(var_name) }

        define_method("#{name}=".to_sym) do |value|
          instance_variable_set(var_name, value)
          history = instance_variable_get("@#{name}_history") || []
          instance_variable_set("@#{name}_history", history << value)
        end

        define_method("#{name}_history".to_sym) { instance_variable_get("@#{name}_history") || [] }
      end
    end

    def strong_attr_accessor(name, type)
      var_name = "@#{name}".to_sym
      define_method(name) { instance_variable_get(var_name) }

      define_method("#{name}=".to_sym) do |value|
        raise 'несовпадение типов' unless value.is_a?(type)

        instance_variable_set(var_name, value)
      end
    end
  end

  module InstanceMethods
  end
end

# class Test
#   include Accessors
#
#   attr_accessor_with_history :my_att, :a, :b, :c
#   strong_attr_accessor :r, Integer
# end
#
# t=Test.new
# print t.instance_variables
# puts ""
# t.a = 3
# t.a = 7
# t.a = 50
# puts t.a_history
# t.r = 10
# puts t.r
# t.r="1c0"
# puts t.r
