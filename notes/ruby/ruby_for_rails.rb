#### 1. HOW RUBY WORKS

  A close relative of require is load. The main difference is that if you do this 
    
    require "requiree.rb"
    require "requiree.rb"
    
  nothing happens the second time; whereas if you do this
    
    load "requiree.rb" 
    load "requiree.rb"
    
  Ruby reads in the file twice.
  
  #1.3 Ruby extensions and programming libraries
    
    require 'gem' #gem could be an extension in ruby or C
    
    #1.3.1 Using standard extensions and libraries
      When you install Ruby, you install several layers
      
      1. The Ruby language (ruby interpreter)
      2. A large number of extensions and libraries (standard library)
      
    
  #1.4.1 How to get Ruby to tell you where it’s installed
    
    $irb -r rbconfig
     > Config::CONFIG["bindir"]
     
#### 4. RUBY BUILDING BLOCKS

  In Ruby, you primarily create objects and ask those objects to perform actions.
  Rather than ask in the abstract whether "a" equals "b"
    you ask "a" whether it considers itself equal to "b"
    
  If you want to know whether a given "student" is taking class from a 
   given "teacher", you ask the student: Do you have this teacher?
   
  *domain-modeling mindset
  
  ### Intro to OOP
    In OOP, you perform your calculations, data manipulation, 
    and input/output operations by creating objects and 
    then requesting information and actions from those objects.
    
    You send a message to an object; and the object executes 
    the method with the name that corresponds to your message.
    
    Ruby code is made up of expressions, each of which 
    evaluates to a particular value.
    
    When Ruby sees a plain word sitting there, it 
    interprets it as one of three things: a local 
    variable, a method call, or a keyword.
    
    object_id
    respond_to?
    send
    
#### 5. ORGANIZING OBJECTS WITH CLASSES
  
  Constants can change - yikes!!
  If you change the value of a constant Ruby prints a warning.
  
  attr_reader :attribute
  attr_writer :attribute
  
  attr_accessor :attribute
  attr :attribute
  