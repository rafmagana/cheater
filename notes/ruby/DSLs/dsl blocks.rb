#DSL blocks implements the Vistor pattern

################################### Strategy 1
class A_Class
  def initialize(caller)
    @caller = caller
  end
  def foo
    "foo"
  end
end

def a_method
  yield A_Class.new(self)
end


a_method do |instance|
  instance.foo # => "foo"
end

################################### Strategy 2
def a_method(&block) # !> method redefined; discarding old a_method
  a_class = A_Class.new(self)
  a_class.instance_eval(&block)
end

a_method do
  @caller = nil #screwing up the object - very bad
  foo # => "foo"
end

################################### Strategy 3
class A_Class
  def initialize(caller) # !> method redefined; discarding old initialize
    @caller = caller
  end
  def foo # !> method redefined; discarding old foo
    "foo"
  end
  def method_missing(name, *params)
    puts "last ditch method #{name.inspect} called with params: #{params.inspect}"
  end
end

###########################################################################################################

module MyDSL
  def method_1; "m1";end
  def method_2; "m2";end
end
class MyClass
  def self.apply_dsl(&definitions)
    obj = MyClass.new
    obj.extend(MyDSL)
    obj.instance_eval(&definitions)
  end
end

MyClass.apply_dsl do
  method_1 # => "m1"
  method_2 # => "m2"
end