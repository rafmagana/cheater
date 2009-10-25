#CHAPTER 1 - RUBY IN REVIEW

#Variables - types are defined by the first characters
  * [a-z_]  #local vars
  * $       #global vars
  * @       #instance vars (inside a method), class instance variables - attributes (outside a method)
  * @@      #class variables
  * [A-Z]   #constants
  
#Comments
  hash #single line comment
  =begin, =end #multiline comments

#1.2.3. Constants, Variables, and Types
  puts "#{a} times #{b} = #{a*b}"   #  3 times 79 = 237
  `ls -l` or %x[grep -i meta *.html | wc -l] #back-quotes execute system commands
  [1, 2, "blah", `ls -l`] #arrays can contain both integers and strings
  %w() or %w[] or %w// #shortcut to create arrays ie %w(a b c)
  {"elem1" => "value1", :elem2 => [5, 4]} # a hash or associative array or dictionary
  "#{var}" #prints var inside quotes

#1.2.4. Operators and Precedence - highest to lower
  :: #scope
  [] #indexing
  ** #exponentiation
  + - ! ~ #unary pos/neg, not
  * / % #multiplication, division, module
  + - #addition, substraction
  << >> #logical shifts
  & #bitwise and
  | ^ #bitwise or, xor
  > >= < <= #comparision
  == === <=> != =~ !~ #equality, inequality, ...
  && #boolean and
  || #boolean or
  .. ... #range operators
  = += -= #assignment
  ?: #ternary
  not #boolean negation
  and or #boolean and, or
  
#1.2.6. Looping and Branching
  if a>0 then b else c end #if form, it expects true to get into the loop
  unless a<=0 then c else b end #unless form, it expects false to get into the loop
  case, when, else, end #case (switch)
  [while, end], [until, end], [for, end], [for, in, do, end], [loop, do, end] #looping constructs
  [array.each, end], [list.each_index, do, end], [2.times, do, end], [0.upto(2), do, end] #ruby specific looping constructs

#1.2.7. Exceptions
  raise #raises and exception
  RuntimeError #default error
  raise "Some error message" #raises a RuntimeError exception
  raise ExceptionTypeClass, "message", caller #caller is an array an stores filename:line in method
  begin-rescue-retry-else-ensure-end #block to handle exceptions
  begin-end #the body of a method definition is an implicit begin-end block
  rescue #catches exceptions and handle them
  retry #it will restart the begin-end block
  ensure #code into ensure clause is always executed before the begin-end block exits
  rescue => err #handle all the error with one resuce, will catch any descendant of StandardError

#1.3. OOP in Ruby
  reference or value #ruby copies variables by references
  obj.object_id #shows the object id
  Symbol #refers to a variable by name rather than by reference

#1.3.3. Modules and Mixins
  Module #a collection of methods and constants that is external to the Ruby program (an OOP abstraction similar to a class)
  Mixin #a module which is mixed with a class by using "include mixin_name" (faking multiple inheritance, hehe)
  include #appends features of a namespace (a module) to the current space
          #module's methods are available as instance methods (object_instance.module_method)
  extend  #appends functions of a module to an object, 
          #module's methods are available as class methods (Module::module_method)
  load #reads a file and inserts it at the current point in the source file
  require #similar to load, but it won't load a file if it has already been loaded.
  
#1.3.4. Creating Classes
  class class_name;end#creates a class
  class name < parent #inheritance
  class names #The name of a class is itself a global constant and thus must begin with an uppercase letter
              #classes in ruby do not strictly speaking have names. 
              #The name is only a constant that is a reference to an object of type Class (Class is a class)
  initialize #similar to the traditional constructor, but it doesn't deal with memory allocation
  new #it creates a new instance of a class, this is the method which handles the memory allocation
  garbage collector #handles deallocation
  self #it'is only a reference to the current receiver, methods prfixed with self will be static methods (Class::Method)
  objects??? #yes, classes are objects because they are instances of Class, weird!
  abstract and concrete classes #classes in ruby are always concrete
  
  #getters and setters made easy (Module class)
   attr_accessor :myvar  #generates a method (myvar) which returns @myvar,
                        #a method (myvar=) that enables the setting of @myvar
   attr_reader :myvar   #create read-only attributes
   attr_writer :myvar   #create write-only attributes
   
   #access modifiers
   private, protected, public #if they takes a symbol like :foo it applies visibility only to those methods
                              #if the symbol is ommited, the modifier applies to all subsequent definitions
                              #private :my_method, public :my_method1, :my_method2
   private #method is accesible only within the class or its subclasses, it's callable only in "function form" with self
   protected #it's callable only from within the class, but it can be called with a reciever other than self
   public #default visiblity for the methods
   
   alias #to create aliases or synonymous for methods ie. "alias new_name old_method"
   
   #1.3.5. Methods and Attributes
   method(arg1, *args) #multiple arguments, args will be an array which can be iterated with args.each
   methods on a per-object basis # my_str = "str"; def my_str.do_something ... end (called singletons)
   
#1.4. Dynamic Aspects of Ruby
  Ruby is totally dynamic, you can define classes, methods and any kind of object at RUNTIME

#1.4.2. Reflection
  defined?(var) #to know if an object, variable, etc is defined
  obj.respond_to?("method") #determines whether an object can respond to the specified method call
  obj.class #returns the class
  obj.is_a?(Class) #determine is obj is of type Class. ie. "bla".is_a?(String) will return true
  obj.kind_of?(Class) #determine is obj is of type Class. ie. "bla".is_a?(String) will return true
  obj.methods #returns all the methods
  
#1.4.3. Missing Methods
  Calling methods #the order is: 
                  # 1.singleton methods
                  # 2.methods defined in my_obj's class, 
                  # 3.methods defined among my_obj's ancestors
                  # 4.calls method_missing method

#1.5.2. Perspectives in Programming
  ?x #it returns the code (integer) of the character "x", ie. var = ?A will return 65
  true #in ruby everything is true but false and nil, and everything means zero, null strings, null character, etc
  ARGV[0] #is truly the first of the command-line parameters, not the file name
  operators #most of the operators are methods
  loop #loop is not a keyword; it is a Kernel method, not a control structure.
  object attributes and local variables are not the same thing in Ruby!! @my_var (attribute), my_var (local var)

  #1.5.3. Ruby's case Statement
  case expression when value some_action end #case uses the === operator, "if value === expression" is the equivalent
  === # x === y is not typically the same as y === x

  #1.5.4. Rubyisms and Idioms
  .. and ... # 1..10 include the 10, 1...10 does not
  end_excluded? #given two ranges m..n and m...n, "end" returns the "n" of both, this method distinguishes between these two sitations
  range.to_a #since 1..3 is not [1, 2, 3], we can turn a range into an array with to_a method
  x ||= 5 #is the same as "x = x || 5" or "x = x ? x : 5"
  x, y = y, x #it swaps the values of the variables
  Class is an object, and Object is a class #yes, it is
  ::Foo means Object::Foo
  fail #it's an alias for raise
  retry #it has different usages in iterators and in exception handling
  initialize #it's always private
  end.method #if an iterator ends in a left brace or "end" and results in a value you can call a method of the result object
  $0 == __FILE__ #to check if file is being run as standalone or not
  < and << # < is used for inheritance (clas X < Y), but << is used for singletons (class << singleton)
  do-end and braces #"my_method param1, foobar do ... end" will bind with my method, but, "my_method param1, foobar {...}" will bind with foobar
  closures  #it remembers the context in which  it was created.
            #exampl with Proc:
            def power(exp)
              proc { |base| base**exp}
            end
            
            square = power(2) # => Proc
            square.call(5) # => 25
  Math::PI = 3.2 #is illegal because there's never an assignment with the scope operator (::) 

  #1.5.5. Expression Orientation and Other Miscellaneous Issues
  Fixnum #it's assigned by value not by reference as array or other types
  
#CHAPTER 2. WORKING WITH STRINGS
