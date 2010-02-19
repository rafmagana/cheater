#Chapter 5. Performing Numerical Calculations
  
  #5.1 representing numbers
    
    104543445343 = 104_543_445_343
    0b1000111010 #binary
    01234        #octal
    0xAF543BFFF  #hex
    
  #5.2. Basic Operations on Numbers
    3**2 # => 9
    
  #5.3. Rounding Floating Point Values
    (3.14159).round # => 3
    (-47.9).round   # => -48
    
    eval(sprintf("%8.6f",3.14159354545))  # 3.141593
  
  #5.18. Performing Base Conversions
    250.to_s(2)  # => "11111010"
    250.to_s(5)  # => "2000"
    250.to_s(8)  # => "372"
    250.to_s(10) # => "250"
    250.to_s(16) # => "fa"
    250.to_s(30) # => "8a"
    
    hex = "%x" % 250 # => "fa"
    oct = "%o" % 250 # => "372"
    bin = "%b" % 250 # => "11111010"
    
  #5.19. Finding Cube Roots, Fourth Roots, and so on
    cube_root   = 4096**(1.0/3.0) # => 16.0
    fourth_root = 4096**(1.0/4.0) # => 8.0