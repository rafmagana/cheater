Every problem has a domain
Every domain has a language

DSL = A semantic model

Medical language, politics, etc

**Two types of DSLs**
	###External### (Parsed and processed)
		_They are not implemented in the host language_
		Examples
			Cucumber, Ruleby, Configuration, Puppet
	###Internal###
		Direct integration with the language
		Examples
			ActiveRecord (callbacks, named scopes, validation routines)
			Rails templates
			RSpec (the model for DSLs these days)
			Ambition (SQL)
			Foundry
			

**The Process to create a DSL**
	1. Break what you want down into functional units
	2. Essential language
		I'm gonna describe how User behaves => "describe" and "User behaves"
	

**Implementation Patterns**
	###Chaining methods### 
		It's powerful but it isn't always desirable 
		All the methods returns self, so you can chain methods 
		Example 
			@account.add(300).withdraw(10).commit <= Good 
			@account.withdraw(30).commit.add(100) <= Bad 
			System doesn't know which method should be first 
	###Dynamic dispatch (slow)### 
		*user__something => user/something (method missing and gsub to replace __) 
		*method_missing 
			VALID_COMMANDS = w%{cmd1 cmd2 cmd3} 
			def method_missing(commmand, *args) 
				super unless VALID_COMMANDS.include?(command.to-s) 
			end 
	###Closures### 
		Single closure that yields an object 
		def method 
			yield Object.new 
		end 
		def method(&block) 
			new_account = instance_eval(&block) 
		end 
		####Nested Closures#### 
			Account.setup do 
				credentials do 
					login "yo" 
				end 
			end 	
	###Proxy Objects### 
		New face on an old API 
		Useful for wrapping libraries 
		Macros = Methods that generate code 
		def	method 
			code = "def another_method;end" 
			instance_eval code 
		end 
		
Create a "template" API file to describe all the methods your DSL has and how they work