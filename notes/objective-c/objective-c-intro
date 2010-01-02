Objective-C
	• it's a set of extensions to the standard ANSI C language

== Calling Methods
	- Whenever you see code inside square brackets, 
	  you are sending a message to an object or a class.
		• [object method];
		• [object methodWithInput:input];
	
	- Getting what an object returns
		output = [object method];
		output = [object methodWithInput:input];
	
	- Calling methods on classes
		id myObject = [NSString string];
			• The id type means that myObject can refer to any kind of object
		NSString* myString = [NSString string];
			• NSString* means that myString is an object of type NSString
			• why the *? All Objective-C object variables are pointers types.
			• The id type is predefined as a pointer type

	- Nested messages - function1 ( function2() )
		• [object1 methodWithInput:[object2 method]];
	
	- Multi-Input Methods
		• (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;
		• BOOL result = [myData writeToFile:@"/tmp/log.txt" atomically:NO];
			- The actual name of the method is "writeToFile:atomically"

== Accessors (setters and getters)
	• All instance variables are private in Objective-C by default
	• In most cases, you don't add the "get" prefix to getters in Objective-C.
	
	- [photo setCaption:@"Day at the Beach"];
	- output = [photo caption]; - caption is a method, not a variable
	
	- Dot syntax (new in Obj-C  2.0 - Mac OS X 10.5)
		• photo.caption = @"hello";
		• output = photo.caption;
		- The dot syntax should only be used setters and getters, 
		  not for general purpose methods.
		
== Creating Objects
	NSString* myString = [NSString string]; - Automatic style
	NSString* myString = [[NSString alloc] init]; - Manual style

== Basic Memory Management
	• NSString* string1 = [NSString string]; - var will be released automatically	
	• NSString* string2 = [[NSString alloc] init];
	  [string2 release]; - must release this when done

= Designing a Class Interface
	• interface is usually stored in the ClassName.h file, and defines instance variables and public methods.
	• implementation is in ClassName.m and contain the actual code for these methods
	
	• Photo interface
		#import <Cocoa.Cocoa.h>
		
		@interface Photo : NSObject {
			NSString* caption;      //instance variable
			NSString* photographer; //instance variable
		}
		
		//GETTERS
		- caption; -------------------|
		- photographer; --------------| technically correct, but it's unusual
		
		- (NSString*) caption; -------|
		- (NSString*) photographer; --| the right way
		
		//SETTERS
		- (void) setCaption: (NSString*)input;
		- (void) setPhotographer: (NSString*)input;
		
		@end
		
		• The colon in Photo : NSObject defines de super-class (NSObject)
		• A single dash before a method name means it's a instance method. 
		• A plus before a method name means it's a class method.
		• By default, the compiler assumes a method returns an id object, 
		  and that all input values are id.
		• Setters don't need to return a value, so we just specify them as void.
	
== Class Implementation
	#import "Photo.h"
	
	@implementation Photo
	
	//GETTERS
	- (NSString*) caption {
		return caption;
	}
	
	- (NSString*) photographer {
		return photographer;
	}
	
	//SETTERS
	- (void) setCaption: (NSString*)input
	{
		//without a garbage collected environment
		[caption autorelease];
		caption = [input retain];
		
		//with garbage collected environment
		caption = input;
		
	}
	
	- (void) setPhotographer: (NSString*)input
	{
		[photographer autorelease];
		photographer = [input retain];
	}
	
	//INIT to set initial values for our instance variables
	- (id) init
	{
	    if ( self = [super init] )
	    {
	        [self setCaption:@"Default Caption"];
	        [self setPhotographer:@"Default Photographer"];
	    }
	    return self;
	}
	
	//DEALLOC method is called on an object when it is being removed from memory
	- (void) dealloc
	{
	    [caption release];
	    [photographer release];
	    [super dealloc];
	}
	@end
	
	• Each setter deals with two variables. 
	  The first is a reference to the existing object, 
	  and the second is the new input object.
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	