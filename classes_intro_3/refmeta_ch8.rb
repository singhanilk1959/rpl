#!/usr/bin/env ruby
print %-
Ruby is a very dynamic language: you can insert new methods into classes at run time, create aliases for existing methods, and even define methods on
individual objects.

-
puts ;out = gets ;
print %-

Ruby has a Rich API for reflection. Reflection, also called introspection, simply means that a program can examine its state and its structure. The Ruby Reflection API also allows a program to alter its state and structure. A Ruby program can dynamically set named variables, invoke named methods, even define new classes and new methods.

-
puts ;out = gets ;
print %-
Ruby's Metaprogamming abilites are due to its powerful Reflection API along with its generally dynamic nature, its block and iterators control structutre and its paranthesis optional syntax.

-
puts ;out = gets ;
print %-
Metaprogamming is writing programs (or frameworks) that help you write programs.
It is a set of techniques for extending Ruby's syntax to make programming easier.

-
puts ;out = gets ;
print %-

Metaprogamming is closely tied to the idea of writing domain specific languages, or DSLs. 

-
puts ;out = gets ;
print %-

Reflection is not by itself Metaprogramming. Metaprogamming typically extends the syntax or behavior of Ruby in some way, and often involves more than one kind of reflection.

-
puts ;out = gets ;
print %-
***************
module A; end                # Empty module
module B; include A; end;    # Module B includes A
class C; include B; end;     # Class C includes module B
class D < C ; end ;

C < B               # => true: C includes B
B < A               # => true: B includes A
C < A               # => true
D < C               # => true
C < D               # => false
Fixnum < Integer    # => true: all fixnums are integers
Integer <Comparable # => true: integers are comparable
Integer < Fixnum    # => false: not all integers are fixnums
String < Numeric    # => nil: strings are not numbers
***************
-

puts ;out = gets ;

module A; end                # Empty module
module B; include A; end;    # Module B includes A
class C; include B; end;     # Class C includes module B
class D < C ; end ;
el = " \n"
print  'C < B ', C < B, el               # => true: C includes B
print 'B < A ', B < A, el               # => true: B includes A
print 'C < A ' , C < A, el              # => true
print 'D < C ', D < C, el
print 'C < D ', C < D, el
print 'Fixnum < Integer ', Fixnum < Integer, el    # => true: all fixnums are integers
print 'Integer <Comparable  ', Integer<Comparable ,el# => true: integers are comparable
print 'Integer < Fixnum ',    Integer < Fixnum  ,el  # => false: not all integers are fixnums
print 'String < Numeric ',    String < Numeric  ,el  # => nil: strings are not numbers

puts ;out = gets ;
print %-
***************
o = C.new 
p = D.new 
o.class				# Returns class of an object o
p.class.superclass		# returns the superclass of a class
o.class.superclass
o.instance_of? C		# o.class == C
o.is_a? C			# o is an instance of C or its subclasses ?
p.is_a? C
p.is_a? D
p.kind_of? D			# kind_of? is a synonym of is_a?
o.respond_to? to_f
C === o ; 			#whether o is_a? C
***************
-
puts ;out = gets ;

o = C.new 
p = D.new 
print 'o.class' , o.class, el
print 'p.class.superclass ',p.class.superclass,el
print 'o.class.superclass ',o.class.superclass,el
print  'o.instance_of? C ' , o.instance_of?(C) ; puts
print 'o.is_a? C '
print o.is_a? C ; puts
print 'p.is_a? C '
print p.is_a? C ; puts
print 'p.is_a? D '
print p.is_a? D ; puts
print 'p.kind_of? D '
print p.kind_of? D ; puts
print 'p.respond_to? :to_f  '
print p.respond_to?(:to_f) ; puts
print 'C === o  '
print C === o ; puts

puts ;out = gets ;
print %-
***************

A.ancestors         # => [A]
B.ancestors         # => [B, A]
C.ancestors         # => [C, B, A, Object, Kernel]
String.ancestors    # => [String, Enumerable, Comparable, Object, Kernel]
                    # Note: in Ruby 1.9 String is no longer Enumerable
***************
-

o = C.new 
p = D.new 
print   'A.ancestors ' ,A.ancestors,el        # => [A]
print 'B.ancestors ',    B.ancestors   ,el     # => [B, A]
print 'C.ancestors ',    C.ancestors,el        # => [C, B, A, Object, Kernel]
print 'D.ancestors ',    D.ancestors,el        # => [C, B, A, Object, Kernel]
print 'String.ancestors ',    String.ancestors   ,el # => [String, Enumerable, Comparable, Object, Kernel]

puts ;out = gets ;

print 'C.include?(B) ',  C.include?(B), el       # => true
print 'C.include?(A) ',  C.include?(A), el       # => true
print 'B.include?(A) ',  B.include?(A), el       # => true
print 'A.include?(A) ',  A.include?(A), el       # => false 
print 'A.include?(B) ',  A.include?(B), el       # => false
print 'D.include?(C) ',  'Invalid Argument of Class type, should be of module type', el,el       # => false

print 'A.included_modules ',  A.included_modules,el  # => []
print 'B.included_modules ',  B.included_modules,el  # => [A]
print 'C.included_modules ',  C.included_modules,el  # => [B, A, Kernel]
print 'D.included_modules ',  D.included_modules,el  # => [B, A, Kernel]

puts ;out = gets ;

print %-
***************
module Greeter; def hi; "hello"; end; end # A silly module
s = "string object"
s.extend(Greeter)       # Add hi as a singleton method to s
s.hi                    # => "hello"
String.extend(Greeter)  # Add hi as a class method of String
String.hi               # => "hello"
***************
-
puts
module Greeter; def hi; "hello"; end; end # A silly module
s = "string object"
s.extend(Greeter)       # Add hi as a singleton method to s
print 's.hi ', s.hi , el                   # => "hello"
String.extend(Greeter)  # Add hi as a class method of String
print  'String.hi ',String.hi, el              # => "hello"

puts ;out = gets ;
print %q-
***************
# Module.nesting returns an array that specifies the nesting of modules at 
# current location

module M
  class C
    Module.nesting   # => [M::C, M]
  end
end
***************
-
module M
  class C
    Module.nesting   # => [M::C, M]
  end
end

puts ;out = gets ;

print %-
***************
M = Module.new      # Define a new module M
C = Class.new       # Define a new class C
D = Class.new(C) {  # Define a subclass of C
  include M         # that includes module M
}
D.to_s              # => "D": class gets constant name by magic
*********************
-
puts ;out = gets ;

print %-
***************
x = 1
eval "x + 1"  # => 2
***************
-
x = 1
puts eval "x + 1"  # => 2

puts ;out = gets ;

print %-
A Binding Object represents the state of Ruby's variable bindings at some moment.

***************
class Object     # Open Object to add a new method
  def bindings   # Note plural on this method
    binding      # This is the predefined Kernel method
  end
end

class Test       # A simple class with an instance variable
  def initialize(x); @x = x; end
end

t = Test.new(10)       # Create a test object
eval("@x", t.bindings) # => 10: We've peeked inside t
t.bindings.eval("@x") # => 10: We've peeked inside t (in 1.9)
***************
-

class Object     # Open Object to add a new method
  def bindings   # Note plural on this method
    binding      # This is the predefined Kernel method
  end
end

class Test       # A simple class with an instance variable
  def initialize(x); @x = x; end
end

t = Test.new(10)       # Create a test object
print eval("@x", t.bindings) # => 10: We've peeked inside t
puts
print t.bindings.eval("@x") # => 10: We've peeked inside t
puts

puts ;out = gets ;
print %-
***************
Object class defines instance_eval and can be used with any object.
Module class defines class_eval and can be used with Class objects only. 

When used to define methods:
instance_eval defines singleton methods of the object.
class_eval defines regular instance methods.

t.instance_eval("@x")  # Return the value of t's instance variable @x

# Define an instance method len of String to return string length
String.class_eval("def len; size; end")

# Here's another way to do that
# The quoted code behaves just as if it was inside "class String" and "end"
String.class_eval("alias len size")

# Use instance_eval to define class method String.empty
# Note that quotes within quotes get a little tricky...
String.instance_eval("def empty; ''; end")
***************
-


puts t.instance_eval("@x")  # Return the value of o's instance variable @x
String.class_eval("def len; size; end")
String.class_eval("alias len size")
String.instance_eval("def empty; ''; end")

puts ;out = gets ;
print %-

***************
instance_eval and class_eval accepts blocks also.

t.instance_eval { @x }
String.class_eval {
  def len
    size
  end
}
String.class_eval { alias len size }
String.instance_eval { def empty; ""; end }
***************
-
t.instance_eval { @x }
String.class_eval {
  def len
    size
  end
}
String.class_eval { alias len size }
String.instance_eval { def empty; ""; end }

puts ;out = gets ;
print %-

***************
# Kernel, Object and Module define reflective methods for listing the names of
# global_variables, instance_variables, currently defined local varibale
# of an object and class_variables,constants of a class or module

# Define a simple class
class Point
  def initialize(x,y); @x,@y = x,y; end # Define instance variables
  @@classvar = 1                        # Define a class variable
  ORIGIN = Point.new(0,0)               # Define a constant
end

Point::ORIGIN.instance_variables # => ["@y", "@x"]
Point.class_variables            # => ["@@classvar"]
Point.constants                  # => ["ORIGIN"]

global_variables   # => ["$DEBUG", "$SAFE", ...]
x = 1              # Define a local variable
local_variables    # => ["x"]
***************
-
print global_variables,el   # => ["$DEBUG", "$SAFE", ...]
x = 1              # Define a local variable
print local_variables,el    # => ["x"]

# Define a simple class
class Point
  def initialize(x,y); @x,@y = x,y; end # Define instance variables
  @@classvar = 1                        # Define a class variable
  ORIGIN = Point.new(0,0)               # Define a constant
end

print Point::ORIGIN.instance_variables,el # => ["@y", "@x"]
print Point.class_variables,el            # => ["@@classvar"]
print Point.constants,el                  # => ["ORIGIN"]

puts ;out = gets ;
print %q-
*************************
Ruby Object and Module also defines reflective methods for querying, setting, and removing instance variable, class variables and constants.

For global and local variables, only eval can be used.

Object and Module define private methods for undefining instance variables, class variables, and constants.

***************
x = 1
$g = 5
varname = "x"
eval(varname)           # => 1
eval("varname = '$g'")  # Set varname to "$g"
eval("#{varname} = x")  # Set $g to 1
eval(varname)           # => 1

***************
-
x = 1
$g = 5
varname = "x"
print eval(varname),el           # => 1
print eval("varname = '$g'"),el  # Set varname to "$g"
puts  x
print '$g = ', $g ,el
eval("#{varname} = x")  # Set $g to 1
print '$g = ', $g ,el
eval("$g = 3")  # Set $g to 1
print '$g = ', $g,el
print eval(varname),el           # => 1

puts ;out = gets ;
print %q-
***************************
o = Object.new
o.instance_variable_set(:@x, 0)   # Note required @ prefix
o.instance_variable_get(:@x)      # => 0
o.instance_variable_defined?(:@x) # => true

Object.class_variable_set(:@@x, 1)   # Private in Ruby 1.8
Object.class_variable_get(:@@x)      # Private in Ruby 1.8
Object.class_variable_defined?(:@@x) # => true; Ruby 1.9 and later

Math.const_set(:EPI, Math::E*Math::PI)
Math.const_get(:EPI)             # => 8.53973422267357
Math.const_defined? :EPI         # => true 

String.class_eval { class_variable_set(:@@y, 1) }  # Set @@x in String
String.class_eval { class_variable_get(:@@y) }     # => 1

o.instance_eval { remove_instance_variable :@x }
String.class_eval { remove_class_variable(:@@y) }
Object.class_eval { remove_class_variable(:@@x) }
Math.send :remove_const, :EPI  # Use send to invoke private method
******************
-
o = Object.new
o.instance_variable_set(:@x, 0)   # Note required @ prefix
o.instance_variable_get(:@x)      # => 0
o.instance_variable_defined?(:@x) # => true

Object.class_variable_set(:@@x, 1)   # Private in Ruby 1.8
Object.class_variable_get(:@@x)      # Private in Ruby 1.8
Object.class_variable_defined?(:@@x) # => true; Ruby 1.9 and later

Math.const_set(:EPI, Math::E*Math::PI)
Math.const_get(:EPI)             # => 8.53973422267357
Math.const_defined? :EPI         # => true 

String.class_eval { class_variable_set(:@@y, 1) }  # Set @@x in String
String.class_eval { class_variable_get(:@@y) }     # => 1

o.instance_eval { remove_instance_variable :@x }
String.class_eval { remove_class_variable(:@@y) }
Object.class_eval { remove_class_variable(:@@x) }
Math.send :remove_const, :EPI  # Use send to invoke private method

puts ;out = gets ;
print %q-
The const_missing method of a module is invoked,if there is one, when a reference is made to an undefined constant.

*******************
def Symbol.const_missing(name)
  name # Return the constant name as a symbol
end
Symbol::Test   # => :Test: undefined constant evaluates to a Symbol
*******************
-
def Symbol.const_missing(name)
  name # Return the constant name as a symbol
end
print Symbol::Test,el   # => :Test: undefined constant evaluates to a Symbol

puts ;out = gets ;
print %q-
*******************
Object defines methods for listing the names of methods defined on the object.

***********************
o.methods                # => [ names of all public methods ]
o.public_methods         # => the same thing
o.public_methods(false)  # Exclude inherited methods
o.protected_methods      # => []: there aren't any
o.private_methods        # => array of all private methods
o.private_methods(false) # Exclude inherited private methods
def o.single; 1; end     # Define a singleton method
o.singleton_methods      # => ["single"] (or [:single] in 1.9)
***********************
-
o.methods                # => [ names of all public methods ]
o.public_methods         # => the same thing
o.public_methods(false)  # Exclude inherited methods
o.protected_methods      # => []: there aren't any
o.private_methods        # => array of all private methods
o.private_methods(false) # Exclude inherited private methods
def o.single; 1; end     # Define a singleton method
o.singleton_methods      # => ["single"] (or [:single] in 1.9)

puts ;out = gets ;
print %q-
**********************
Module defines following methods to do the similar query on a class rather than on the instance of a class as above.
***********************
String.instance_methods(false) == "s".public_methods(false)  # => true
String.public_instance_methods == String.instance_methods    # => true
String.protected_instance_methods       # => []
String.private_instance_methods(false)  # => ["initialize_copy",
                                        #     "initialize"]
Math.singleton_methods  # => ["acos", "log10", "atan2", ... ]
***********************
-
String.instance_methods(false) == "s".public_methods(false)  # => true
String.public_instance_methods == String.instance_methods    # => true
String.protected_instance_methods       # => []
String.private_instance_methods(false)  # => ["initialize_copy",
                                        #     "initialize"]
Math.singleton_methods  # => ["acos", "log10", "atan2", ... ]

puts ;out = gets ;
print %q-
Module also defines some predicates for testing 
***********************
String.public_method_defined? :reverse  # => false
String.protected_method_defined? :reverse  # => false
String.private_method_defined? :initialize # => true
String.method_defined? :upcase!            # => true (as public or prot method)
String.method_defined? :downcase  #=> true
print String.respond_to? :downcase ; #=> false
print "hello".respond_to? :downcase ; puts #=> true
print String.respond_to? :superclass ; puts #=> true
***********************

Module method_defined? is same as Object.respond_to?.
In Ruby 1.9 you can pass false as the second argument to specify that inherited methods should not be considered

-
print String.public_method_defined? :reverse ;puts  # => false
print String.protected_method_defined? :reverse ;puts  # => false
print String.private_method_defined? :initialize  ;puts# => true
print String.method_defined? :upcase!    ;puts         # => true
print String.method_defined? :downcase ; puts #=> true
print String.respond_to? :downcase ; puts #=> false
print "hello".respond_to? :downcase ; puts #=> false
print String.respond_to? :superclass ; puts #=> false

puts ;out = gets ;
print %q-
*********************
Send can invoke any named method of an object, including private and protected methods.

***********************
"hello".send :upcase        # => "HELLO": invoke an instance method
Math.send(:sin, Math::PI/2) # => 1.0: invoke a class method
"hello".send :puts, "world"         # prints "world"
"hello".public_send :puts, "world"  # raises NoMethodError
***********************
-
"hello".send :upcase        # => "HELLO": invoke an instance method
Math.send(:sin, Math::PI/2) # => 1.0: invoke a class method
"hello".send :puts, "world"         # prints "world"
#"hello".public_send :puts, "world"  # raises NoMethodError

puts ;out = gets ;
print %q-
*********************
Defining, Undefining and Aliasing methods

define_method, alias_method, remove_method, undef_method are private methods of 
Module.

define_method is used to define a method of class or module.
***********************

# Add an instance method named m to class c with body b 
def add_method(c, m, &b)
  c.class_eval {
    define_method(m, &b)
  }
end

add_method(String, :greet) { "Hello, " + self }

"world".greet   # => "Hello, world"

***********************
-
def add_method(c, m, &b)
  c.class_eval {
    define_method(m, &b)
  }
end

add_method(String, :greet) { "Hello, " + self }

puts "world".greet   # => "Hello, world"

puts ;out = gets ;
print %q-

To define a class method with define_method, invoke it on eigenclass.

***********************
def add_class_method(c, m, &b)
  eigenclass = class << c; self; end
  eigenclass.class_eval {
    define_method(m, &b)
  }
end

add_class_method(String, :greet) {|name| "Hello, " + name }

String.greet("world")  # => "Hello, world"

In Ruby 1.9, Object provides deine_singleton_method for defining a class method

String.define_singleton_method(:greet1) {|name| "Hello, " + name }
String.greet1("world1")  # => "Hello, world1"
***********************

define_method does not allow you to specify a method body that expects a block. Use def statement with class_eval to define a method that accepts a block.

-
def add_class_method(c, m, &b)
  eigenclass = class << c; self; end
  eigenclass.class_eval {
    define_method(m, &b)
  }
end

add_class_method(String, :greet) {|name| "Hello, " + name }

puts String.greet("world")  # => "Hello, world"

String.define_singleton_method(:greet1) {|name| "Hello, " + name }
puts String.greet1("world1")  # => "Hello, world1"

puts ;out = gets ;
print %q-
****************************
alias plus +         # Make "plus" a synonym for the + operator

# Create an alias for the method m in the class (or module) c
def backup(c, m, prefix="original")
  n = :"#{prefix}_#{m}"    # Compute the alias
  c.class_eval {           # Because alias_method is private
    alias_method n, m      # Make n an alias for m
  }
end

backup(String, :reverse)
"test".original_reverse # => "tset"
****************************
-
#alias plus +         # Make "plus" a synonym for the + operator

# Create an alias for the method m in the class (or module) c
def backup(c, m, prefix="original")
  n = :"#{prefix}_#{m}"    # Compute the alias
  c.class_eval {           # Because alias_method is private
    alias_method n, m      # Make n an alias for m
  }
end

backup(String, :reverse)
puts "test".original_reverse # => "tset"
puts ;out = gets ;
print %q-
****************************
undef staement works only with hardcoded identifiers.


def phello ; :hello ; end
def phello ; :hello ; end
undef phello
def phello ; :hello ; end
****************************
-
def phello ; :hello ; end
def phello ; :hello ; end
undef phello
def phello ; :hello ; end

puts ;out = gets ;
print %q-

define_method, alias_method, remove_method, undef_method are private methods of 
Module and thus works with Class or Module objects only.

****************************
class Chello ; def x ; :hello ;  end ; remove_method(:x); end
class Chello ; def x ; :hello ;  end ; undef_method :x ; end
class Chello ; def x ; :hello ;  end ;  end
Chello.class_eval { remove_method :x }
class Chello ; def x ; :hello ;  end ;  end
Chello.class_eval { undef_method "x" }
class Chello ; def x ; :hello ;  end ;  end
Chello.instance_eval { undef_method "x" }
class Chello ; def x ; :hello ;  end ;  end
Chello.instance_eval { undef_method "x" }
****************************
-
class Chello ; def x ; :hello ;  end ; remove_method(:x); end
class Chello ; def x ; :hello ;  end ; undef_method :x ; end
class Chello ; def x ; :hello ;  end ;  end
Chello.class_eval { remove_method :x }
class Chello ; def x ; :hello ;  end ;  end
Chello.class_eval { undef_method "x" }

puts ;out = gets ;
print %q-
To remove a class method...use eigenclass of the Class
****************************
class Chello ; def self.x ; :hello ;  end ;  end
Chello.x 
Chello.instance_eval { class << self ;remove_method :x; end  }
#Chello.x 
class Chello ; def self.x ; :hello ;  end ;  end
Chello.x 
Chello.class_eval { class << self ;remove_method :x; end  }
-
class Chello ; def self.x ; :hello ;  end ;  end
Chello.x 
Chello.instance_eval { class << self ;remove_method :x; end  }
#Chello.x 
class Chello ; def self.x ; :hello ;  end ;  end
Chello.x 
Chello.class_eval { class << self ;remove_method :x; end  }

puts ;out = gets ;
print %q-
***************************
remove_method removes the definition from the current class.
undef_method removes the definition from the current class and prevent any invocation from the current class of the inherited version.

****************************
class Chello ; def x ; :hello ;  end ;  end
class Xhello < Chello  ; def x ; :hello ;  end ;  end
Xhello.class_eval { remove_method :x }
Xhello.new.x  # invokes Chello.x
class Xhello < Chello  ; def x ; :hello ;  end ;  end
Xhello.class_eval { undef_method :x }
#Xhello.new.x  # will not let you invole Chello.x


-
class Chello ; def x ; :hello ;  end ;  end
class Xhello < Chello  ; def x ; :hello ;  end ;  end
Xhello.class_eval { remove_method :x }
Xhello.new.x  # invokes Chello.x
class Xhello < Chello  ; def x ; :hello ;  end ;  end
Xhello.class_eval { undef_method :x }
#Xhello.new.x  # will not let you invole Chello.x


puts ;out = gets ;
print %q^
********************
Defining your own method-missing method for a class allows you an opportunity to handle any kind of invocation on instances of the class.

The method-missing hook is one of the most powerfulnof Ruby's dynamic capabilities and one of the most common metaprogramming techniques.

*********************
class Hash
  # Allow hash values to be queried and set as if they were attributes.
  # We simulate attribute getters and setters for any key.
  def method_missing(key, *args)
    text = key.to_s

    if text[-1,1] == "="               # If key ends with = set a value
      self[text.chop.to_sym] = args[0] # Strip = from key
    else                               # Otherwise...
      self[key]                        # ...just return the key value
    end
  end
end

h = {}         # Create an empty hash object
h.one = 1      # Same as h[:one] = 1
puts h.one     # Prints 1. Same as puts h[:one]
*********************
^
class Hash
  # Allow hash values to be queried and set as if they were attributes.
  # We simulate attribute getters and setters for any key.
  def method_missing(key, *args)
    text = key.to_s

    if text[-1,1] == "="               # If key ends with = set a value
      self[text.chop.to_sym] = args[0] # Strip = from key
    else                               # Otherwise...
      self[key]                        # ...just return the key value
    end
  end
end

h = {}         # Create an empty hash object
h.one = 1      # Same as h[:one] = 1
puts h.one     # Prints 1. Same as puts h[:one]


puts ;out = gets ;
print %q^
**********************
SETTING METHOD VISIBILITY

public,protected, and private are privated instance methods of Module that are used during class definition and can be used dynamically with class_eval.

private_class_method and public_class_method work on class methods and they themselves are Modules public methods.

*************************************
String.class_eval { private :reverse }
"hello".reverse  # NoMethodError: private method 'reverse'
# Make all Math methods private
# Now we have to include Math in order to invoke its methods
Math.private_class_method *Math.singleton_methods
*************************************
^
String.class_eval { private :reverse }
#"hello".reverse  # NoMethodError: private method 'reverse'
# Make all Math methods private
# Now we have to include Math in order to invoke its methods
Math.private_class_method *Math.singleton_methods

puts ;out = gets ;
print %q^
---------------------------
def Object.inherited(c)
  puts "class #{c} < #{self}"
end
---------------------------
module Final             # A class that includes Final can't be subclassed
  def self.included(c)   # When included in class c
    c.instance_eval do   # Define a class method of c
      def inherited(sub) # To detect subclasses
        raise Exception, # And abort with an exception
              "Attempt to create subclass #{sub} of Final class #{self}"
      end
    end
  end
end
---------------------------
def String.method_added(name) 
  puts "New instance method #{name} added to String"
end
---------------------------
def String.singleton_method_added(name)
  puts "New class method #{name} added to String"
end
---------------------------
# Including this module in a class prevents instances of that class
# from having singleton methods added to them. Any singleton methods added
# are immediately removed again.
module Strict
  def singleton_method_added(name)
    STDERR.puts "Warning: singleton #{name} added to a Strict object"
    eigenclass = class << self; self; end
    eigenclass.class_eval { remove_method name }
  end
end
---------------------------
---------------------------
^
def Object.inherited(c)
  puts "class #{c} < #{self}"
end
module Final             # A class that includes Final can't be subclassed
  def self.included(c)   # When included in class c
    c.instance_eval do   # Define a class method of c
      def inherited(sub) # To detect subclasses
        raise Exception, # And abort with an exception
              "Attempt to create subclass #{sub} of Final class #{self}"
      end
    end
  end
end
def String.method_added(name) 
  puts "New instance method #{name} added to String"
end
def String.singleton_method_added(name)
  puts "New class method #{name} added to String"
end
# Including this module in a class prevents instances of that class
# from having singleton methods added to them. Any singleton methods added
# are immediately removed again.
module Strict
  def singleton_method_added(name)
    STDERR.puts "Warning: singleton #{name} added to a Strict object"
    eigenclass = class << self; self; end
    eigenclass.class_eval { remove_method name }
  end
end

puts ;out = gets ;
print %q^
---------------------------
---------------------------
STDERR.puts "#{__FILE__}:#{__LINE__): invalid data"
---------------------------
raise "Assertion failed in #{__method__} at #{__FILE__}:#{__LINE__}"
---------------------------
SCRIPT_LINES__ = {__FILE__ => File.readlines(__FILE__)}
---------------------------
SCRIPT_LINES__[__FILE__][__LINE__-1]
---------------------------
# Print a message every time $SAFE changes
trace_var(:$SAFE) {|v|
  puts "$SAFE set to #{v} at #{caller[1]}"
}
---------------------------
Kernel.set_trace_fun

ObjectSpace.each_object(Class) {|c| puts c }
ObjectSpace._id2ref
ObjectSpace.define_finalizer
ObjectSpace.undefine_finalizer
ObjectSpace.garbage_collect
GC.start
GC.disable
GC.enable

^

__END__

module A; end                # Empty module
module B; include A; end;    # Module B includes A
class C; include B; end;     # Class C includes module B

C < B               # => true: C includes B
B < A               # => true: B includes A
C < A               # => true
D < C
C < D
Fixnum < Integer    # => true: all fixnums are integers
Integer <Comparable # => true: integers are comparable
Integer < Fixnum    # => false: not all integers are fixnums
String < Numeric    # => nil: strings are not numbers

A.ancestors         # => [A]
B.ancestors         # => [B, A]
C.ancestors         # => [C, B, A, Object, Kernel]
String.ancestors    # => [String, Enumerable, Comparable, Object, Kernel]
                    # Note: in Ruby 1.9 String is no longer Enumerable

C.include?(B)       # => true
C.include?(A)       # => true
B.include?(A)       # => true
A.include?(A)       # => false 
A.include?(B)       # => false

A.included_modules  # => []
B.included_modules  # => [A]
C.included_modules  # => [B, A, Kernel]
---------------------------
module Greeter; def hi; "hello"; end; end # A silly module
s = "string object"
s.extend(Greeter)       # Add hi as a singleton method to s
s.hi                    # => "hello"
String.extend(Greeter)  # Add hi as a class method of String
String.hi               # => "hello"
---------------------------
module M
  class C
    Module.nesting   # => [M::C, M]
  end
end
---------------------------
M = Module.new      # Define a new module M
C = Class.new       # Define a new class C
D = Class.new(C) {  # Define a subclass of C
  include M         # that includes module M
}
D.to_s              # => "D": class gets constant name by magic
---------------------------
x = 1
eval "x + 1"  # => 2
---------------------------
class Object     # Open Object to add a new method
  def bindings   # Note plural on this method
    binding      # This is the predefined Kernel method
  end
end

class Test       # A simple class with an instance variable
  def initialize(x); @x = x; end
end

t = Test.new(10)       # Create a test object
eval("@x", t.bindings) # => 10: We've peeked inside t
---------------------------
o.instance_eval("@x")  # Return the value of o's instance variable @x

# Define an instance method len of String to return string length
String.class_eval("def len; size; end")

# Here's another way to do that
# The quoted code behaves just as if it was inside "class String" and "end"
String.class_eval("alias len size")

# Use instance_eval to define class method String.empty
# Note that quotes within quotes get a little tricky...
String.instance_eval("def empty; ''; end")
---------------------------
o.instance_eval { @x }
String.class_eval {
  def len
    size
  end
}
String.class_eval { alias len size }
String.instance_eval { def empty; ""; end }
---------------------------
global_variables   # => ["$DEBUG", "$SAFE", ...]
x = 1              # Define a local variable
local_variables    # => ["x"]

# Define a simple class
class Point
  def initialize(x,y); @x,@y = x,y; end # Define instance variables
  @@classvar = 1                        # Define a class variable
  ORIGIN = Point.new(0,0)               # Define a constant
end

Point::ORIGIN.instance_variables # => ["@y", "@x"]
Point.class_variables            # => ["@@classvar"]
Point.constants                  # => ["ORIGIN"]
---------------------------
x = 1
varname = "x"
eval(varname)           # => 1
eval("varname = '$g'")  # Set varname to "$g"
eval("#{varname} = x")  # Set $g to 1
eval(varname)           # => 1
---------------------------
o = Object.new
o.instance_variable_set(:@x, 0)   # Note required @ prefix
o.instance_variable_get(:@x)      # => 0
o.instance_variable_defined?(:@x) # => true

Object.class_variable_set(:@@x, 1)   # Private in Ruby 1.8
Object.class_variable_get(:@@x)      # Private in Ruby 1.8
Object.class_variable_defined?(:@@x) # => true; Ruby 1.9 and later

Math.const_set(:EPI, Math::E*Math::PI)
Math.const_get(:EPI)             # => 8.53973422267357
Math.const_defined? :EPI         # => true 
---------------------------
String.class_eval { class_variable_set(:@@x, 1) }  # Set @@x in String
String.class_eval { class_variable_get(:@@x) }     # => 1
---------------------------
o.instance_eval { remove_instance_variable :@x }
String.class_eval { remove_class_variable(:@@x) }
Math.send :remove_const, :EPI  # Use send to invoke private method
---------------------------
def Symbol.const_missing(name)
  name # Return the constant name as a symbol
end
Symbol::Test   # => :Test: undefined constant evaluates to a Symbol
---------------------------
o = "a string"
o.methods                # => [ names of all public methods ]
o.public_methods         # => the same thing
o.public_methods(false)  # Exclude inherited methods
o.protected_methods      # => []: there aren't any
o.private_methods        # => array of all private methods
o.private_methods(false) # Exclude inherited private methods
def o.single; 1; end     # Define a singleton method
o.singleton_methods      # => ["single"] (or [:single] in 1.9)
---------------------------
String.instance_methods == "s".public_methods                # => true
String.instance_methods(false) == "s".public_methods(false)  # => true
String.public_instance_methods == String.instance_methods    # => true
String.protected_instance_methods       # => []
String.private_instance_methods(false)  # => ["initialize_copy",
                                        #     "initialize"]
---------------------------
Math.singleton_methods  # => ["acos", "log10", "atan2", ... ]
---------------------------
String.public_method_defined? :reverse     # => true
String.protected_method_defined? :reverse  # => false
String.private_method_defined? :initialize # => true
String.method_defined? :upcase!            # => true
---------------------------
"s".method(:reverse)             # => Method object 
String.instance_method(:reverse) # => UnboundMethod object
---------------------------
"hello".send :upcase        # => "HELLO": invoke an instance method
Math.send(:sin, Math::PI/2) # => 1.0: invoke a class method
---------------------------
"hello".send :puts, "world"         # prints "world"
---------------------------
"hello".public_send :puts, "world"  # raises NoMethodError
---------------------------
# Add an instance method named m to class c with body b 
def add_method(c, m, &b)
  c.class_eval {
    define_method(m, &b)
  }
end

add_method(String, :greet) { "Hello, " + self }

"world".greet   # => "Hello, world"
---------------------------
def add_class_method(c, m, &b)
  eigenclass = class << c; self; end
  eigenclass.class_eval {
    define_method(m, &b)
  }
end

add_class_method(String, :greet) {|name| "Hello, " + name }

String.greet("world")  # => "Hello, world"
---------------------------
String.define_singleton_method(:greet) {|name| "Hello, " + name }
---------------------------
alias plus +         # Make "plus" a synonym for the + operator
---------------------------
# Create an alias for the method m in the class (or module) c
def backup(c, m, prefix="original")
  n = :"#{prefix}_#{m}"    # Compute the alias
  c.class_eval {           # Because alias_method is private
    alias_method n, m      # Make n an alias for m
  }
end

backup(String, :reverse)
"test".original_reverse # => "tset"
---------------------------
class Hash
  # Allow hash values to be queried and set as if they were attributes.
  # We simulate attribute getters and setters for any key.
  def method_missing(key, *args)
    text = key.to_s

    if text[-1,1] == "="               # If key ends with = set a value
      self[text.chop.to_sym] = args[0] # Strip = from key
    else                               # Otherwise...
      self[key]                        # ...just return the key value
    end
  end
end

h = {}         # Create an empty hash object
h.one = 1      # Same as h[:one] = 1
puts h.one     # Prints 1. Same as puts h[:one]
---------------------------
String.class_eval { private :reverse }
"hello".reverse  # NoMethodError: private method 'reverse'
---------------------------
# Make all Math methods private
# Now we have to include Math in order to invoke its methods
Math.private_class_method *Math.singleton_methods
---------------------------
def Object.inherited(c)
  puts "class #{c} < #{self}"
end
---------------------------
module Final             # A class that includes Final can't be subclassed
  def self.included(c)   # When included in class c
    c.instance_eval do   # Define a class method of c
      def inherited(sub) # To detect subclasses
        raise Exception, # And abort with an exception
              "Attempt to create subclass #{sub} of Final class #{self}"
      end
    end
  end
end
---------------------------
def String.method_added(name) 
  puts "New instance method #{name} added to String"
end
---------------------------
def String.singleton_method_added(name)
  puts "New class method #{name} added to String"
end
---------------------------
# Including this module in a class prevents instances of that class
# from having singleton methods added to them. Any singleton methods added
# are immediately removed again.
module Strict
  def singleton_method_added(name)
    STDERR.puts "Warning: singleton #{name} added to a Strict object"
    eigenclass = class << self; self; end
    eigenclass.class_eval { remove_method name }
  end
end
---------------------------
STDERR.puts "#{__FILE__}:#{__LINE__): invalid data"
---------------------------
raise "Assertion failed in #{__method__} at #{__FILE__}:#{__LINE__}"
---------------------------
SCRIPT_LINES__ = {__FILE__ => File.readlines(__FILE__)}
---------------------------
SCRIPT_LINES__[__FILE__][__LINE__-1]
---------------------------
# Print a message every time $SAFE changes
trace_var(:$SAFE) {|v|
  puts "$SAFE set to #{v} at #{caller[1]}"
}
---------------------------
# Print out a list of all known classes
ObjectSpace.each_object(Class) {|c| puts c }
---------------------------
require 'afterevery'

1.upto(5) {|i| after i { puts i} }  # Slowly print the numbers 1 to 5
sleep(5)                            # Wait five seconds
every 1, 6 do |count|               # Now slowly print 6 to 10
  puts count
  break if count == 10
  count + 1                         # The next value of count
end
sleep(6)                            # Give the above time to run
---------------------------
#
# Define Kernel methods after and every for deferring blocks of code.
# Examples:
#
#   after 1 { puts "done" }
#   every 60 { redraw_clock }
#
# Both methods return Thread objects. Call kill on the returned objects
# to cancel the execution of the code.
#
# Note that this is a very naive implementation. A more robust
# implementation would use a single global timer thread for all tasks,
# would allow a way to retrieve the value of a deferred block, and would
# provide a way to wait for all pending tasks to complete.
#

# Execute block after sleeping the specified number of seconds.
def after(seconds, &block)  
  Thread.new do     # In a new thread...
    sleep(seconds)  # First sleep 
    block.call      # Then call the block
  end               # Return the Thread object right away
end

# Repeatedly sleep and then execute the block.
# Pass value to the block on the first invocation.  
# On subsequent invocations, pass the value of the previous invocation.
def every(seconds, value=nil, &block)
  Thread.new do                 # In a new thread...
    loop do                     # Loop forever (or until break in block)
      sleep(seconds)            # Sleep
      value = block.call(value) # And invoke block
    end                         # Then repeat..
  end                           # every returns the Thread
end
---------------------------
require 'thread'  # Ruby 1.8 keeps Mutex in this library

# Obtain the Mutex associated with the object o, and then evaluate
# the block under the protection of that Mutex.
# This works like the synchronized keyword of Java.
def synchronized(o)
  o.mutex.synchronize { yield }
end

# Object.mutex does not actually exist. We've got to define it.
# This method returns a unique Mutex for every object, and
# always returns the same Mutex for any particular object.
# It creates Mutexes lazily, which requires synchronization for
# thread safety.
class Object
  # Return the Mutex for this object, creating it if necessary.
  # The tricky part is making sure that two threads don't call
  # this at the same time and end up creating two different mutexes.
  def mutex
    # If this object already has a mutex, just return it
    return @__mutex if @__mutex
    
    # Otherwise, we've got to create a mutex for the object.
    # To do this safely we've got to synchronize on our class object.
    synchronized(self.class) {
      # Check again: by the time we enter this synchronized block,
      # some other thread might have already created the mutex.
      @__mutex = @__mutex || Mutex.new
    }
    # The return value is @__mutex
  end
end

# The Object.mutex method defined above needs to lock the class 
# if the object doesn't have a Mutex yet. If the class doesn't have
# its own Mutex yet, then the class of the class (the Class object)
# will be locked. In order to prevent infinite recursion, we must
# ensure that the Class object has a mutex.
Class.instance_eval { @__mutex = Mutex.new }
---------------------------
# This module provides constants that define the UTF-8 strings for
# all Unicode codepoints. It uses const_missing to define them lazily.
# Examples:
#   copyright = Unicode::U00A9
#   euro = Unicode::U20AC
#   infinity = Unicode::U221E
module Unicode
  # This method allows us to define Unicode codepoint constants lazily.
  def self.const_missing(name)  # Undefined constant passed as a symbol
    # Check that the constant name is of the right form.
    # Capital U followed by a hex number between 0000 and 10FFFF.
    if name.to_s =~ /^U([0-9a-fA-F]{4,5}|10[0-9a-fA-F]{4})$/
      # $1 is the matched hexadecimal number. Convert to an integer.
      codepoint = $1.to_i(16)
      # Convert the number to a UTF-8 string with the magic of Array.pack.
      utf8 = [codepoint].pack("U")
      # Make the UTF-8 string immutable.
      utf8.freeze
      # Define a real constant for faster lookup next time, and return
      # the UTF-8 text for this time.
      const_set(name, utf8)
    else 
      # Raise an error for constants of the wrong form.
      raise NameError, "Uninitialized constant: Unicode::#{name}"
    end
  end
end
---------------------------
a = [1,2,3].trace("a")
a.reverse
puts a[2]
puts a.fetch(3)
---------------------------
Invoking: a.reverse() at trace1.rb:66
Returning: [3, 2, 1] from a.reverse to trace1.rb:66
Invoking: a.fetch(3) at trace1.rb:67
Raising: IndexError:index 3 out of array from a.fetch
---------------------------
# Call the trace method of any object to obtain a new object that
# behaves just like the original, but which traces all method calls
# on that object. If tracing more than one object, specify a name to
# appear in the output. By default, messages will be sent to STDERR, 
# but you can specify any stream (or any object that accepts strings
# as arguments to <<).
class Object
  def trace(name="", stream=STDERR)
    # Return a TracedObject that traces and delegates everything else to us.
    TracedObject.new(self, name, stream)
  end
end

# This class uses method_missing to trace method invocations and
# then delegate them to some other object. It deletes most of its own
# instance methods so that they don't get in the way of method_missing.
# Note that only methods invoked through the TracedObject will be traced.
# If the delegate object calls methods on itself, those invocations
# will not be traced.
class TracedObject
  # Undefine all of our noncritical public instance methods.
  # Note the use of Module.instance_methods and Module.undef_method.
  instance_methods.each do |m|
    m = m.to_sym  # Ruby 1.8 returns strings, instead of symbols
    next if m == :object_id || m == :__id__ || m == :__send__
    undef_method m
  end

  # Initialize this TracedObject instance.
  def initialize(o, name, stream)
    @o = o            # The object we delegate to
    @n = name         # The object name to appear in tracing messages
    @trace = stream   # Where those tracing messages are sent
  end

  # This is the key method of TracedObject. It is invoked for just
  # about any method invocation on a TracedObject.
  def method_missing(*args, &block)
    m = args.shift         # First arg is the name of the method
    begin
      # Trace the invocation of the method.
      arglist = args.map {|a| a.inspect}.join(', ')
      @trace << "Invoking: #{@n}.#{m}(#{arglist}) at #{caller[0]}\n"
      # Invoke the method on our delegate object and get the return value.
      r = @o.send m, *args, &block
      # Trace a normal return of the method.
      @trace << "Returning: #{r.inspect} from #{@n}.#{m} to #{caller[0]}\n"
      # Return whatever value the delegate object returned.
      r
    rescue Exception => e
      # Trace an abnormal return from the method.
      @trace << "Raising: #{e.class}:#{e} from #{@n}.#{m}\n"
      # And re-raise whatever exception the delegate object raised.
      raise
    end
  end

  # Return the object we delegate to.
  def __delegate
    @o
  end
end
---------------------------
def synchronized(o)
  o.mutex.synchronize { yield }
end
---------------------------
def synchronized(o)
  if block_given?
    o.mutex.synchronize { yield }
  else
    SynchronizedObject.new(o)
  end
end

# A delegating wrapper class using method_missing for thread safety
# Instead of extending Object and deleting our methods we just extend
# BasicObject, which is defined in Ruby 1.9. BasicObject does not 
# inherit from Object or Kernel, so the methods of a BasicObject cannot
# invoke any top-level methods: they are just not there.
class SynchronizedObject  < BasicObject
  def initialize(o); @delegate = o;  end
  def __delegate; @delegate; end

  def method_missing(*args, &block)
    @delegate.mutex.synchronize {
      @delegate.send *args, &block
    }
  end
end
---------------------------
class Module
  private     # The methods that follow are both private

  # This method works like attr_reader, but has a shorter name
  def readonly(*syms)
    return if syms.size == 0  # If no arguments, do nothing
    code = ""                 # Start with an empty string of code
    # Generate a string of Ruby code to define attribute reader methods.
    # Notice how the symbol is interpolated into the string of code.
    syms.each do |s|                     # For each symbol
      code << "def #{s}; @#{s}; end\n"   # The method definition
    end
    # Finally, class_eval the generated code to create instance methods.
    class_eval code
  end

  # This method works like attr_accessor, but has a shorter name.
  def readwrite(*syms)
    return if syms.size == 0
    code = ""
    syms.each do |s|
      code << "def #{s}; @#{s} end\n"
      code << "def #{s}=(value); @#{s} = value; end\n"
    end
    class_eval code
  end
end
---------------------------
class Point
  attributes :x => 0, :y => 0
end
---------------------------
class Point
  attributes x:0, y:0
end
---------------------------
class Module
  # This method defines attribute reader and writer methods for named
  # attributes, but expects a hash argument mapping attribute names to
  # default values. The generated attribute reader methods return the
  # default value if the instance variable has not yet been defined.
  def attributes(hash)
    hash.each_pair do |symbol, default|   # For each attribute/default pair
      getter = symbol                     # Name of the getter method
      setter = :"#{symbol}="              # Name of the setter method
      variable = :"@#{symbol}"            # Name of the instance variable
      define_method getter do             # Define the getter method
        if instance_variable_defined? variable
          instance_variable_get variable  # Return variable, if defined
        else
          default                         # Otherwise return default
        end
      end

      define_method setter do |value|     # Define setter method
        instance_variable_set variable,   # Set the instance variable
                              value       # To the argument value
      end
    end
  end

  # This method works like attributes, but defines class methods instead
  # by invoking attributes on the eigenclass instead of on self.
  # Note that the defined methods use class instance variables
  # instead of regular class variables.  
  def class_attrs(hash)
    eigenclass = class << self; self; end
    eigenclass.class_eval { attributes(hash) }
  end

  # Both methods are private
  private :attributes, :class_attrs
end
---------------------------
require 'classtrace'
---------------------------
ruby -rclasstrace my_program.rb  --traceout /tmp/trace
---------------------------
# We define this module to hold the global state we require, so that
# we don't alter the global namespace any more than necessary.
module ClassTrace
  # This array holds our list of files loaded and classes defined.
  # Each element is a subarray holding the class defined or the
  # file loaded and the stack frame where it was defined or loaded.
  T = []  # Array to hold the files loaded

  # Now define the constant OUT to specify where tracing output goes.
  # This defaults to STDERR, but can also come from command-line arguments
  if x = ARGV.index("--traceout")    # If argument exists
    OUT = File.open(ARGV[x+1], "w")  # Open the specified file
    ARGV[x,2] = nil                  # And remove the arguments
  else
    OUT = STDERR                     # Otherwise default to STDERR
  end
end

# Alias chaining step 1: define aliases for the original methods
alias original_require require
alias original_load load

# Alias chaining step 2: define new versions of the methods 
def require(file)
  ClassTrace::T << [file,caller[0]]     # Remember what was loaded where
  original_require(file)                # Invoke the original method
end
def load(*args)
  ClassTrace::T << [args[0],caller[0]]  # Remember what was loaded where
  original_load(*args)                  # Invoke the original method
end

# This hook method is invoked each time a new class is defined
def Object.inherited(c)
  ClassTrace::T << [c,caller[0]]        # Remember what was defined where
end

# Kernel.at_exit registers a block to be run when the program exits
# We use it to report the file and class data we collected
at_exit {
  o = ClassTrace::OUT
  o.puts "="*60
  o.puts "Files Loaded and Classes Defined:"
  o.puts "="*60
  ClassTrace::T.each do |what,where|
    if what.is_a? Class  # Report class (with hierarchy) defined
      o.puts "Defined: #{what.ancestors.join('<-')} at #{where}"
    else                 # Report file loaded
      o.puts "Loaded: #{what} at #{where}"
    end
  end
}
---------------------------
# Define a Module.synchronize_method that alias chains instance methods
# so they synchronize on the instance before running.
class Module
  # This is a helper function for alias chaining.
  # Given a method name (as a string or symbol) and a prefix, create
  # a unique alias for the method, and return the name of the alias
  # as a symbol. Any punctuation characters in the original method name
  # will be converted to numbers so that operators can be aliased.
  def create_alias(original, prefix="alias")
    # Stick the prefix on the original name and convert punctuation
    aka = "#{prefix}_#{original}"
    aka.gsub!(/([\=\|\&\+\-\*\/\^\!\?\~\%\<\>\[\]])/) {
      num = $1[0]                       # Ruby 1.8 character -> ordinal
      num = num.ord if num.is_a? String # Ruby 1.9 character -> ordinal
      '_' + num.to_s
    }
    
    # Keep appending underscores until we get a name that is not in use
    aka += "_" while method_defined? aka or private_method_defined? aka

    aka = aka.to_sym            # Convert the alias name to a symbol
    alias_method aka, original  # Actually create the alias
    aka                         # Return the alias name
  end

  # Alias chain the named method to add synchronization
  def synchronize_method(m)
    # First, make an alias for the unsynchronized version of the method.
    aka = create_alias(m, "unsync") 
    # Now redefine the original to invoke the alias in a synchronized block.
    # We want the defined  method to be able to accept blocks, so we
    # can't use define_method, and must instead evaluate a string with 
    # class_eval. Note that everything between %Q{ and the matching } 
    # is a double-quoted string, not a block. 
    class_eval %Q{
      def #{m}(*args, &block)
        synchronized(self) { #{aka}(*args, &block) }
      end
    }
  end
end

# This global synchronized method can now be used in three different ways.
def synchronized(*args)
  # Case 1: with one argument and a block, synchronize on the object
  # and execute the block
  if args.size == 1 && block_given?
    args[0].mutex.synchronize { yield }

  # Case two: with one argument that is not a symbol and no block
  # return a SynchronizedObject wrapper
  elsif args.size == 1 and not args[0].is_a? Symbol and not block_given?
    SynchronizedObject.new(args[0])

  # Case three: when invoked on a module with no block, alias chain the
  # named methods to add synchronization. Or, if there are no arguments, 
  # then alias chain the next method defined.
  elsif self.is_a? Module and not block_given?
    if (args.size > 0) # Synchronize the named methods
      args.each {|m| self.synchronize_method(m) }
    else
      # If no methods are specified synchronize the next method defined
      eigenclass = class<<self; self; end 
      eigenclass.class_eval do # Use eigenclass to define class methods
        # Define method_added for notification when next method is defined
        define_method :method_added do |name|
          # First remove this hook method
          eigenclass.class_eval { remove_method :method_added }
          # Next, synchronize the method that was just added
          self.synchronize_method name
        end
      end
    end

  # Case 4: any other invocation is an error
  else
    raise ArgumentError, "Invalid arguments to synchronize()"
  end
end
---------------------------
# Define trace! and untrace! instance methods for all objects.
# trace! "chains" the named methods by defining singleton methods
# that add tracing functionality and then use super to call the original.
# untrace! deletes the singleton methods to remove tracing.
class Object
  # Trace the specified methods, sending output to STDERR.
  def trace!(*methods)
    @_traced = @_traced || []    # Remember the set of traced methods

    # If no methods were specified, use all public methods defined 
    # directly (not inherited) by the class of this object 
    methods = public_methods(false) if methods.size == 0

    methods.map! {|m| m.to_sym } # Convert any strings to symbols
    methods -= @_traced          # Remove methods that are already traced
    return if methods.empty?     # Return early if there is nothing to do
    @_traced |= methods          # Add methods to set of traced methods

    # Trace the fact that we're starting to trace these methods
    STDERR << "Tracing #{methods.join(', ')} on #{object_id}\n"

    # Singleton methods are defined in the eigenclass
    eigenclass = class << self; self; end

    methods.each do |m|         # For each method m
      # Define a traced singleton version of the method m.
      # Output tracing information and use super to invoke the
      # instance method that it is tracing.
      # We want the defined  methods to be able to accept blocks, so we
      # can't use define_method, and must instead evaluate a string.
      # Note that everything between %Q{ and the matching } is a 
      # double-quoted string, not a block. Also note that there are 
      # two levels of string interpolations here. #{} is interpolated
      # when the singleton method is defined. And \#{} is interpolated 
      # when the singleton method is invoked.
      eigenclass.class_eval %Q{
        def #{m}(*args, &block)
          begin
            STDERR << "Entering: #{m}(\#{args.join(', ')})\n"
            result = super
            STDERR << "Exiting: #{m} with \#{result}\n"
            result
          rescue
            STDERR << "Aborting: #{m}: \#{$!.class}: \#{$!.message}"
            raise
          end
        end
      }
    end
  end

  # Untrace the specified methods or all traced methods
  def untrace!(*methods)
    if methods.size == 0    # If no methods specified untrace
      methods = @_traced    # all currently traced methods
      STDERR << "Untracing all methods on #{object_id}\n"
    else                    # Otherwise, untrace
      methods.map! {|m| m.to_sym }  # Convert string to symbols
      methods &= @_traced   # all specified methods that are traced
      STDERR << "Untracing #{methods.join(', ')} on #{object_id}\n"
    end

    @_traced -= methods     # Remove them from our set of traced methods

    # Remove the traced singleton methods from the eigenclass
    # Note that we class_eval a block here, not a string
    (class << self; self; end).class_eval do
      methods.each do |m|
        remove_method m     # undef_method would not work correctly
      end
    end

    # If no methods are traced anymore, remove our instance var 
    if @_traced.empty?
      remove_instance_variable :@_traced
    end
  end
end
---------------------------
pagetitle = "Test Page for XML.generate"
XML.generate(STDOUT) do 
  html do
    head do
      title { pagetitle }
      comment "This is a test"
    end
    body do
      h1(:style => "font-family:sans-serif") { pagetitle }
      ul :type=>"square" do
        li { Time.now }
        li { RUBY_VERSION }
      end
    end
  end
end
---------------------------
<html><head>
<title>Test Page for XML.generate</title>
<!-- This is a test -->
</head><body>
<h1 style='font-family:sans-serif'>Test Page for XML.generate</h1>
<ul type='square'>
<li>2007-08-19 16:19:58 -0700</li>
<li>1.9.0</li>
</ul></body></html>
---------------------------
class XML
  # Create an instance of this class, specifying a stream or object to
  # hold the output. This can be any object that responds to <<(String).
  def initialize(out)
    @out = out  # Remember where to send our output
  end

  # Output the specified object as CDATA, return nil.
  def content(text)
    @out << text.to_s
    nil
  end

  # Output the specified object as a comment, return nil.
  def comment(text)
    @out << "<!-- #{text} -->"
    nil
  end

  # Output a tag with the specified name and attributes.
  # If there is a block invoke it to output or return content.
  # Return nil.
  def tag(tagname, attributes={})
    # Output the tag name
    @out << "<#{tagname}"

    # Output the attributes
    attributes.each {|attr,value| @out << " #{attr}='#{value}'" }
    
    if block_given?
      # This block has content
      @out << '>'             # End the opening tag
      content = yield         # Invoke the block to output or return content
      if content              # If any content returned
        @out << content.to_s  # Output it as a string
      end
      @out << "</#{tagname}>" # Close the tag
    else 
      # Otherwise, this is an empty tag, so just close it.
      @out << '/>'
    end
    nil # Tags output themselves, so they don't return any content
  end

  # The code below is what changes this from an ordinary class into a DSL.
  # First: any unknown method is treated as the name of a tag.
  alias method_missing tag

  # Second: run a block in a new instance of the class.
  def self.generate(out, &block)
    XML.new(out).instance_eval(&block)
  end
end
---------------------------
class HTMLForm < XMLGrammar
  element :form, :action => REQ,
                 :method => "GET",
                 :enctype => "application/x-www-form-urlencoded",
                 :name => OPT
  element :input, :type => "text", :name => OPT, :value => OPT,
                  :maxlength => OPT, :size => OPT, :src => OPT,
                  :checked => BOOL, :disabled => BOOL, :readonly => BOOL
  element :textarea, :rows => REQ, :cols => REQ, :name => OPT,
                     :disabled => BOOL, :readonly => BOOL
  element :button, :name => OPT, :value => OPT,
                   :type => "submit", :disabled => OPT
end
---------------------------
HTMLForm.generate(STDOUT) do
  comment "This is a simple HTML form"
  form :name => "registration",
       :action => "http://www.example.com/register.cgi" do
    content "Name:"
    input :name => "name"
    content "Address:"
    textarea :name => "address", :rows=>6, :cols=>40 do
      "Please enter your mailing address here"
    end
    button { "Submit" }
  end
end
---------------------------
class XMLGrammar
  # Create an instance of this class, specifying a stream or object to
  # hold the output. This can be any object that responds to <<(String).
  def initialize(out)
    @out = out  # Remember where to send our output
  end

  # Invoke the block in an instance that outputs to the specified stream.
  def self.generate(out, &block)
    new(out).instance_eval(&block)
  end

  # Define an allowed element (or tag) in the grammar.
  # This class method is the grammar-specification DSL
  # and defines the methods that constitute the XML-output DSL.
  def self.element(tagname, attributes={})
    @allowed_attributes ||= {}
    @allowed_attributes[tagname] = attributes

    class_eval %Q{
      def #{tagname}(attributes={}, &block)
        tag(:#{tagname},attributes,&block)
      end
    }
  end

  # These are constants used when defining attribute values.
  OPT = :opt     # for optional attributes
  REQ = :req     # for required attributes
  BOOL = :bool   # for attributes whose value is their own name

  def self.allowed_attributes
    @allowed_attributes
  end

  # Output the specified object as CDATA, return nil.
  def content(text)
    @out << text.to_s
    nil
  end

  # Output the specified object as a comment, return nil.
  def comment(text)
    @out << "<!-- #{text} -->"
    nil
  end

  # Output a tag with the specified name and attribute.
  # If there is a block, invoke it to output or return content.
  # Return nil.
  def tag(tagname, attributes={})
    # Output the tag name
    @out << "<#{tagname}"

    # Get the allowed attributes for this tag.
    allowed = self.class.allowed_attributes[tagname]

    # First, make sure that each of the attributes is allowed.
    # Assuming they are allowed, output all of the specified ones.
    attributes.each_pair do |key,value|
      raise "unknown attribute: #{key}" unless allowed.include?(key)
      @out << " #{key}='#{value}'"
    end

    # Now look through the allowed attributes, checking for 
    # required attributes that were omitted and for attributes with
    # default values that we can output.
    allowed.each_pair do |key,value|
      # If this attribute was already output, do nothing.
      next if attributes.has_key? key
      if (value == REQ)
        raise "required attribute '#{key}' missing in <#{tagname}>"
      elsif value.is_a? String
        @out << " #{key}='#{value}'"
      end
    end

    if block_given?
      # This block has content
      @out << '>'             # End the opening tag
      content = yield         # Invoke the block to output or return content
      if content              # If any content returned
        @out << content.to_s  # Output it as a string
      end
      @out << "</#{tagname}>" # Close the tag
    else 
      # Otherwise, this is an empty tag, so just close it.
      @out << '/>'
    end
    nil # Tags output themselves, so they don't return any content.
  end
end
---------------------------
