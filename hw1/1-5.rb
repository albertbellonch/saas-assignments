#!/usr/bin/env ruby

class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval <<-STR
      def #{attr_name}=(v)
        @#{attr_name} = v
        @#{attr_name}_history ||= [nil]
        @#{attr_name}_history << v
      end
    STR
  end
end

class Foo
  attr_accessor_with_history :bar
end

f = Foo.new
g = Foo.new

f.bar = 1
g.bar = 4
f.bar = 2
f.bar = 1

puts f.bar_history.inspect
puts g.bar_history.inspect
