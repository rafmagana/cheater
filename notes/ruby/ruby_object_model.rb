###############################################

Ruby - A compulsive obsession for the objects (and an object of obsession)
  an introduction to the Ruby Object Model

  Ruby is a language who took the OO principles very seriously
    in some kind of obsessive way (but we like it for this)
  In Ruby everything is possible, you can turn private methods into public with meta-progamming or evaling
  Ruby copies smalltalk in many ways
  Ruby used ! and ? in its method names, this was taken from Common Lisp


###############################################

############################################### OOP CONCEPTS
A class is a template
A class contains variables and methods that describe the state and the behavior of an entity

* public - los métodos públicos (public) pueden ser usados por cualquiera; no hay un control de acceso.
* protected - los métodos protegidos (protected) pueden ser usados únicamente por objetos de la misma clase y subclases, a las que pertenece el método; pero nunca por el propio objeto. Por así decirlo, el método sólo lo pueden usar los otros miembro de la familia.
* private - los métodos privados (private) sólo pueden ser usado por el propio objeto. Técnicamente, se dice que el receptor del método siempre es el mismo: self.


###############################################

###############################################
what is a Class?

There are two types of classes: real clases and meta-classes

Meta-classes # inserted in the inheritance chain before the objects "real" class

An Object is storage for variables. Instance variables.

So the instance variable is in the object and the accessor methods are in the class. 
They’re in two completely different spots.

It’s an important lesson: objects do not store methods, only classes can.
  
Classes Are Objects

I mean if everything is an object in Ruby, then classes and 
objects should both be objects. right? YES!!! :O

“If a class is an object, but objects are built on classes, 
isn’t there a big confusing infinite cycle here that you’re not explaining?”

a class isn’t really an object

struct RObject {
  struct RBasic basic;
  struct st_table *iv_tbl; # instance variables table
};

struct RClass {
  struct RBasic basic;
  struct st_table *iv_tbl; # instance variables table
  struct st_table *m_tbl; # methods table
  VALUE super; # pointer to a superclass
};

But let me reassure you. To a Ruby programmer, a class is an object.
Because it meets the two big criteria:
 you can store instance variables 
in a class and it is descended from the Object class. That’s it.
###############################################


###########################################
What is contained inside the object “obj” ?

some flags (we won’t bother about that in this post)
instance variables (describe the state of “obj”)
a reference to the class, that is : MyClass
Ok fine, but where are the methods? We have to follow the reference to MyClass to find them.

What is contained inside the object “MyClass” ?

some flags
Instance variables (describe the state of “MyClass”. From “obj” point of view, it’s the class variables, those you reference with @@)
a reference to the super class (if any. In this case, it is “Object”)
a reference to the class (what? I’m confused now!)
Methods (Ahh! Here they are! From “obj” point of view, these are INSTANCE methods)

First of all, let’s not confuse the super class with the reference to the class. 
The super class is a reference to the ancestor of the current object (in this case, 
  the ancestor is Object), while the reference to the class contains additional information about the current object.
That “reference to the class” is in fact a reference to a special class 
(the pickaxe book call it a meta class) that will hold the methods for the object “MyClass”.
so there’s no reason they cannot have their own methods. 
if “obj” is able to store it’s methods inside “MyClass”, 
  “MyClass” has to be able to store it’s methods in some other place too : 
  This place is the meta class. You can’t have access to these classes directly, they are completely hidden.
###########################################

###################################### MODULES
A Ruby Module is an object that acts as a placeholder for methods and constants.
Module is actually the superclass of Class.
The main distinction is that you can not create instances of a module, but you can (obviously) create instances of a class.
#####################################

############## THE CHAIN TO FIND A METHOD
Calling obj.my_instance_method
ruby follows the reference to “MyClass” and looks for the method, it finds it. voila!

Calling obj.display
ruby follows the reference to “MyClass” and looks for the method “display”. 
Unfortunately this time, it doesn’t find it. Instead of crying, ruby doesn’t give up 
and looks for the method in any module that could have been mixed into MyClassbut still it can’t find it. 
Determined as we know it, ruby now follows the reference to the super class (Object) 
in hope to find that method. Victory, the method is there! The call succeeds.

Calling obj,my_class_method
Once again, ruby follows the reference to MyClass and tries to find “my_class_method”, 
it isn’t there. It looks in any mixed in module, it isn’t there. It looks in the super class, 
it isn’t there. It looks in any module that could have been mixed in the super class, 
it still isn’t there. Now the chain is over, because “Object” has no super class. 
Ruby invokes “method_missing” and the story ends in a very bad way 
(people are crying and sobbing to the point that it gets quite embarassing).

Calling MyClass.my_class_method
Now the starting point is MyClass instead of obj. Ruby follows the reference to the class of MyClass, 
let’s call it MetaMyClass. Once comfortable inside MetaMyClass, it looks for the method 
“my_class_method” and guess what? It finds it! The call succeeds.

Calling MyClass.name
Since ruby won’t find the method “name” inside MetaMyClass, what will it do? 
  It will look into the super class of MetaMyClass, which we’ll call MetaObject. 
  MetaObject contains the method “name”… so the call will succeed!
###########################################################

#########################################################
3 steps to understand how classes and objects work in ruby

1) The starting point is the object, not the class
   a class is also an object. Every classes you are defining are instances of a class named Class
   Only one instance for each class definition is needed in a typical ruby / rails application
   no need of String.new and String2.new, Just one factory to create String instances is enough
   String2 = Class.new(String)
   
2) An object structure is not frozen and can be altered at any time
   having a private method waza, you can turn it to public outside the class with NoSafe.send(:public, :waza)
    it also changed the structure of every single instances!

3) Things that don’t look like objects often are
   result = 5 + 3
   The “+” method of the Fixnum instance named “5″ is called
   The Fixnum instance named “3″ is passed as a parameter to the “+” method.
   The result of the call is a FixNum instance and is assigned to an object called “result”, 
   which in turn becomes a FixNum instance
   Another explanation: it does some magic behind the scene. 
        It adds a dot, 
        trims the spaces and somehow manage 
        to transform the arithmetic expression 
        in a standard object method call.
   a=1
   b=1
   c=1
   1, a, b and c points to the same space in memory because we can only have one instance of Fixnum
   
   foo.bar = 42 #it's not an assignment it's a message send
#########################################################

###################################### ASSIGNMENTS
my_obj = MyClass.new does what you think it does
my_obj.yadayada = "123" does not

As soon as Ruby sees the dot after an object name, it expects to see a method, nothing else.
Ruby doesn’t want you to play with the attribute of an object directly, it wants you to call it’s accessor methods.
That’s why you have to name your attribute writers with a trailing “=” if you want to give the illusion that an assignment occured
use attr_reader, attr_writer, attr_accessor, attr to do the magic
  
  What is the method name in my_hash[:my_key] = “some value” ?
  Answer: the instance method []=
##################################################

################################################## MODULES
A module could be two things:
A module could be namespace, a way to regroup similar things to 
help us organize our application better and to avoid name clashes.
A module could be a mixin (mixed in)

A module is like a class with 3 key differences:

It is not a class (this one is the killer)
It cannot be instantiated (i.e. you cannot do x = MyModule.new)
It can be mixed in a class to enhance its possibilities

Although a module cannot have instances, it can still have instance methods.
 those instance methods will become the instance methods of the client (the class).
 
Class inheritance : An aloes (class) IS A plant (class)
Mixins : An aloes (class) HAS some healing properties (module)


################################################### VIDEOS DE RUBY OBJECT MODEL
  
  #VIDEO 1
  in languages like java or C# you think in classes and its relationships
  in Ruby we think in objects, there are classes, but
  they are there to help to create object
  
  stop Class-oriented development
  go for Object-oriented development
  
  state + behavior = Object
  
  every object will have its own state
  but  all the methods will share the behavior
  
  #classes doesn't need to have names
  clase = Class.new
  clase # => #<Class:0x28438>
  Person = clase
  clase # => Person
  
  CLASS METHOD DO NOT EVEN EXIST, we only create singletons!!
  
  #VIDEO 2
  prototype-based programming (use clone and singletons)
  inheritance #there's nothing bad about it, just the way we use it
              #we use it to copy functionality from other class
              #inheritance is good when a class is the kind of other class (Cat < Animal)
  
  class Person
    class << self
      attr_accessor :count #it's creating an accesor for a @count (class variable)
    end
  end
###############################################################################


##################################################
In ruby if you use the keyword "super" it calls the superclass method of the same name than the method it is called from
##################################################


##################################################

A Ruby Object consist of the following:

*A reference to the object immediate class (interpreter stores this as 'klass'). 
  For an object that has a meta-class this is a pointer to the meta-class
*A hash table of instance variables
  objects does not have hash table of methods because object does not have methods, only classes does
*A set of flags
  Singleton, Mark, Finalize, Taint, Exivar, Freeze, A number of "user" flags.
  "Singleton" is set on objects of type Class that are meta-classes.
  Mark and Finalize are used by the garbage collector.
  "Taint" is used for the "taint mode"
  "Exivar" is used for objects of the "fake" builtin classes to indicate that this instance has an external instance variable hash table
  "Freeze" prevents an object from being modified
  
SEND
  Almost all actions in Ruby at least conceptually boils down to sending a message to an object

Ruby Classes
  there are two types:
    "Real" classes
    "Meta"-classes or "eigenclasses" or "virtual" classes (as interpreter refers to)
    
  a meta-class is for all practical purposes an actual class
  a meta-class is created as needed and inserted in the inheritance chain before the objects "real" class

  in C 
    string_object->klass # => String
    we create a meta-class "MetaString" and then
    string_object->klass # => MetaString
    string_object->klass->super # => String
  in Ruby
    string_object.class # => String
    we create a meta-class "MetaString" and then
    string_object.class # => String
   interpreter "skips" over the meta-class (and modules) if it is there
   
################################################## VARIABLES
class ExampleClass
  @variable = "foo"
  @@variable = "bar"
  
  def initialize
    @variable = "baz"
  end
  
  def self.test
    puts @variable
  end
  
  def test
    self.class.test
    puts @@variable
    puts @variable
  end
end

class ExampleSubclass < ExampleClass
  @variable = "1"
  @@variable = "2"
  
  def initialize
    @variable = "3"
  end
end

first_example = ExampleClass.new
first_example.test

puts "---"

second_example = ExampleSubclass.new
second_example.test

Essentially, when you declare a class variable in a base class, it’s shared with all subclasses. 
Changing its value in a subclass will affect the base class and all of its subclasses all the way down the inheritance tree.
This behavior is often exactly what’s desired. But equally often, this behavior is not what was intended by the programmer, 
and it leads to bugs, especially if the programmer did not originally expect for the class to be subclassed by someone else.

I strongly encourage Ruby developers to sit down and think about how they want their classes to behave 
if subclassed by someone else. Be careful about using class variables, because often what you actually 
wanted was an instance variable on the class object.

A variable in Ruby can be distinguished by the characters at the start of its name.

A variable whose name begins with '@' is an instance variable of self.

An instance variable belongs to the object itself. Uninitialized instance variables have a value of nil.

Uninitialized local variables does not have a value nil

Pseudo Variables

self #Execution context of the current method.

nil #The sole-instance of the NilClass class. Expresses nothing.

true #The sole-instance of the TrueClass class. Expresses true.

false #The sole-instance of the FalseClass class. Expresses false. (nil also is considered to be false, and every other value is considered to be true in Ruby.)

The value of a pseudo variable cannot be changed. Substitution to a pseudo variable causes an exception to be raised.