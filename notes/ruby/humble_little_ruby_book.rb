Heredocs my_string = <<MY_STRING

Hexdecimal => prefix with 0x, 0x5C1
Octal => prefix with 0, 01411 = 777d
Binary => prefix with 0b; 
Decimal => prefix with 0d

Numbers => Ruby ignores underscores in numbers, 9_245_43 = 924543

=== VARIABLES
  Variables are not objects but references (pointers) to objects
  t = h = i = 10
  rvalue = [1,2,3]
  a,b = rvalue (a=1 ; b=2)

=== COLLECTIONS

  == RANGES
  
    my_range = 1..10  => 1,2,3,4,5,6,7,8,9,10
    my_range = 1...10 => 1,2,3,4,5,6,7,8,9
    my_range.to_a => [1,2,3,4,5,6,7,8,9,10]
  
    my_range.include?(11) => false
    my_range === 11       => false
    my_range.include?(5)  => true
    my_range === 5        => true
  
    member? is an alias for include?
    
  == ARRAYS
  
    Strings wrapper in %W acts as double quoted string
    Strings wrapper in %w acts as single quoted string
    
    my_array.delete (index)
    
  == HASHES
  
    my_hash = {}
    my_hash = Hash.new
    my_hash.has_key?(:the_key)
    my_hash.has_value?(the_value)
    my_hash.empty?
    my_hash.delete[key]
    my_hash.clear

== REGEXP
  	my_string =~ /regexp_pattern/
  
==BLOCKS AND Proc OBJECTS
  
	A block is an object that contains some Ruby code.
	A Ruby code block is much like a method without a name tagged on it.

	Think of Proc objects as blocks that are pushed into variables.
	Proc objects are simply instances of the Proc class.

	my_proc = Proc.new { |a| puts "hello, #{a}"}
	my_proc.call("world") => hello, world

	my_proc = lambda { |a| puts "hello, #{a}"}
	my_proc.call("world") => hello, world

	Proc objects created with lambda have stricter argument checking.

	with lambda don't affect the flow of the application
	with Proc.new will exit their enclosing method when returning

	with Proc.new, the value returned is the value returned from the block.
	with lambda, it simply returns its value to its parent method

	The & parameter => if you prepend the name of the last parameter
	                   of a method with an ampersand (&), then the block
	                   that is passed to the method will become a Proc.
	                   def ampersand(&block); block.call; yield; end
	
== MODULES
  
  When you call a method, Ruby will first look to the host class 
  (that is, the class being mixed into) and then to its mixins 
  (and then to its superclasses and its mixins and so on); 
  this behavior is the EXACT OPPSITE of constants (and no I don't know why that is). 
  This could be a blessing or a curse (i.e. you may want the method to override yours), 
  but generally this is the safest functionality for it.

== FILES
  
  To include a file in Ruby, you have two options: load and require.
    
  load: include a source code file unconditionally
  require: it'll only include it once (no dup)
  
  both accept either relative or absolute paths (stored in $:)
  
  local variables in included files do not trickle into the context they 
    are included in (contrary to PHP and C/C++ behavior); this variables are
    locked into the context that they are written in.

== EXCEPTIONS
  
  == RESCUE
    begin
      some_code
    rescue ExceptionName
    rescue ExceptionName:
    rescue ExceptionName => error
      puts $! || error
      retry #run the begin/rescue block again
    else
      puts "everything went just fine"
    ensure
      puts "sure thing this will be printed out"
    end
  
  == RAISE (or FAIL)
    raise 
      # re-raises the current exception 
        so it can be passed further up the call stack 
        or raise a new RuntimeError (with no message) 
        if there is no exception.
    raise "message"
    raise ExceptionName
    raise ExceptionName, "message"
    raise ExceptionName, "message", caller (reference to the Kernel.caller method)
    
    - ExceptionName could be a custom exception like class MyException < RuntimeExceptio
    
== THROW AND CATCH
  
  catch :keyword do
    code..
    more...
    
    throw :keyword <= breaks the flow
    
    code_will_not_be_executed
    more_code_will_not_be_executed
  end <= the flow jumps here after the throw
  
== FILESYSTEM INTERACTION
  
  File.directory?("a_directory")
  File.file?("a_file")
  File.exists?("a_file_or_a_directory")
  File.extname("a_file_with_or_without_extension.txt") => ".txt" || ""
  File.executable?("a_file")
  File.readable?("a_file")
  
  == File operations
    File.delete
    File.rename
    File.chow(nil, 201, "a_file")
    File.chmod(0777,"a_file")
  
  == Reading from a file
    myfile = File.open("a_file", "r")
    myfile.each_line {|line| puts line}
    myfile.close
    
    File.open("a_file") do |file|
      file.each_line {|line| puts line}
    end
    
    IO.foreach("a_file") {|line| puts line}
  
  == Writing to a file
    File.open("a_file", "w") do |file|
      file.write("waza")
      file << "more waza\n" << "more more waza\n"
    end
    
    == File access modes
      r => read-only; starts at beginning
      w => write-only; truncates existing file to zer length or creates a new file
      a => append write-only; starts at end of file or creates a new one
      r+ => read-write; beginning
      w+ => read-write; runcates existing file to zer length or creates a new file
      a+ => read-write; starts at end of existing file or creates a new file
      b => binary file mode; may appear with any of the above options (Windows only)
      
== THREADS

  Thread.new { something }
  Thread.new(time) { something }
  Thread.stop
  Thread.current
  thread.stop?
  Thread.current.stop?
  Thread.kill(thread)
  
== FORKS AND PROCESSES
  
  name = system("whoami") #name won't be the result of whoami but true or false
  name = `whoami`
  
  -- Pipes
    rb = IO.popen(a_process, "w+")
    rb.puts "puts 'Whoa!'"
    rb.close_write
    rb.gets
    
  -- Forks
    exec("apachectl restart") if fork.nil?
      the same as using system, but you can tell your app to wait until process exits
    Process.wait #wait until proccess exits

== ENVIRONMENT
  ENV #environment varaiables
  ARGV #array of arguments
  $: # the path