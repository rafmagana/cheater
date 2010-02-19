#CHAPTER 3. WORKING WITH REGULAR EXPRESSIONS
  
  #3.1 RegExp Syntax
    
    /Ruby/      #match the single word Ruby
    /[Rr]uby/   #match Ruby or ruby
    /^abc/      #match an abc beginning of line
    %r{xyz$}    #match an xyz at end of line
    %r|[0-9]*|  #match any sequence of (zero or more) digits
    
    # RegExp modifiers (/^abc/modifier)
      
      i #ignore case
      o #expression subs only once
      m #multiline mode (dot matches new line)
      x #extended regex
      
  #3.2. Compiling Regular Expressions
    
    pattern = Regexp.compile("^foo.*")
    pattern = Regexp.compile("^foo", Regexp::IGNORECASE)
    pattern = Regexp.compile("^foo", Regexp::MULTILINE, u) #utf-8
    Regexp.new is the same as Regexp.compile
  
  #3.3. Escaping Special Characters
  
    str = "[*?]"
    Regexp.escape(str) # => "\[\*\?\]"
    Regexp.quote # alias of escape
    
  #3.4 Using anchors
    
    string="abcXdefXghi"
    /def/  =~ string     # 4 (position)
  
  #3.9. Extended Regular Expressions
  
    regex = /^
            (s)?
            bla
            $
            /x