#CHAPTER 2. WORKING WITH STRINGS

  #2.2 Representing strings
    str = %q/string/ #just like single-quoted string
    str = %Q/string/ #just like double-quoted string
    
  #2.3 Using Here-Docs
    str = << EOF   # double-quoted    
    str = << 'EOF' # single-quoted    
    str = << -EOF  # the end marker may be indented
  
  #2.16 Implicit and explicit conversion
    
    to_s #explicit
    to_str #implicit
    
    puts e                    # calls to_s
    puts "Element is " + e    # calls to_str
    puts "Element is #{e}"    # calls to_s
  
  #2.17 Appending an item onto a string
    str = ""
    str << [1,2,4].to_s << "," << 65.to_s << 65 # => 
  
  #2.18. Removing Trailing Newlines and Other Characters
    chop  #remove last character, it doesn't matter if is not \n
    chomp #remove the last $/ , often it's \n (newline)
    chomp(chars) #remove chars from the end of the string
    str = gets.chop         # Read string, remove newline
    s2 = "Some string\n"    # "Some string" (no newline)
    s3 = s2.chop!           # s2 is now "Some string" also
    s4 = "Other string\r\n"
    s4.chop!                # "Other string" (again no newline)
  
  #2.19 Trimming whitespace from a string
    strip, lstrip (left) or rstrip (right)
    str = "aaaa   \t\n   "
    str.strip # => 
    
  #2.20 Repeating Strings
    "10" * 5 # => "1010101010"
    
  #2.21. Embedding Expressions Within Strings
    "asdsd #{ruby code}"
    "dfdfdfd #$gvar and ivar = #@ivar"
    
  #2.28. Counting characters in strings
    str = "guadalajara"
    str.count('a') # => 5
    str.count('ˆa') # => 6 (letters different than 'a')
    str.count('a-d') # => 6 (range from a to d)
    str.count('^a-l') # => 2
  
  #2.30. Removing duplicate characters
    "hhhhooollaaaa".squeeze # => hola
    "hola...".squeeze # => hola.
    "hoooola...".squeeze(".") # => hooola.
    "hoooola...".squeeze("o") # => hola...
    "hoooola...".squeeze("^o") # => hooola.
    "aabbccddeeff".squeeze("a-d") # => abcdeeff
    
  #2.31. Removing specific characters
    "wazaboonga".delete("a") # => wzboong
    "wazaboonga".delete("^a") # => aaa
    "wazaboonga".delete("a-g") # => wzoon
    
    