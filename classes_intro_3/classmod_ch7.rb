#!/usr/bin/env ruby
print %-
*************
Ruby is an object oriented language in a very pure sense: every value is an 
object(atleast behaves like one) and instance of a class.

Ruby's objects are strictly encapsulated: their state can be accessed only through the methods they define.

Ruby's classes are very open: methods can be added anytime and is possible to add methods to individual objects: singleton methods.
*************
-
puts ; out1 = gets 
print %-
************* Defining a simple class *************
class Point
end

p = Point.new
p.class       # => Point
p.is_a? Point # => true

*************

Like most statements in Ruby, class is an expression whose value is the is the value of the last expression. Typically, last expression is a def statement in a class whose return value is nil.

Within the body of the class, but outside instance methods defined by the class, the self keyword refers to the class being defined.
-
class Point
end

p = Point.new

#puts p.class
#puts p.is_a? Point

puts ; out1 = gets 
print %-
*************
class Point
  def initialize(x,y)
    @x, @y = x, y
  end
end

p = Point.new(0,0)

# The new method of the class object creates a new instance and automatically
# invokes the initialize method on that instance.
# The initialize method is automatically made private. An object can call
# initialize on itself from inside one of its instance methods, but you can not call initalize from outside on p to reinitalize its 
# state.
*************

-
class Point
  def initialize(x,y)
    @x, @y = x, y
  end
end
p = Point.new(0,0)

puts ; out1 = gets 
print %-
*************
class Point
  def initialize(x,y)
    @x, @y = x, y
  end

  def to_s        # Return a String that represents this point
    "(\#@x,\#@y)"   # Just interpolate the instance variables into a string
  end
end

p =  Point.new(1,2)   # Create a new Point object
puts p               # Displays "(1,2)"
*************
-

class Point
  def initialize(x,y)
    @x, @y = x, y
  end

  def to_s        # Return a String that represents this point
    "(#@x,#@y)"   # Just interpolate the instance variables into a string
  end
end
p =  Point.new(1,2)   # Create a new Point object
puts p               # Displays "(1,2)"

puts ; out1 = gets 
print %-
*************
class Point
  def initialize(x,y)
    @x, @y = x, y
  end

  def x           # The accessor (or getter) method for @x
    @x
  end

  def y           # The accessor method for @y
    @y
  end
end

p = Point.new(1,2)
q = Point.new(p.x*2, p.y*3)  # p.x, p.y are method invocations without paranthesis
*************
-
class Point
  def initialize(x,y)
    @x, @y = x, y
  end

  def x           # The accessor (or getter) method for @x
    @x
  end

  def y           # The accessor method for @y
    @y
  end
end

p = Point.new(1,2)
q = Point.new(p.x*2, p.y*3)  # p.x, p.y are method invocations without paranthesis

puts ; out1 = gets 
print %-
*************
class MutablePoint
  def initialize(x,y); @x, @y = x, y; end

  def x; @x; end       # The getter method for @x
  def y; @y; end       # The getter method for @y

  def x=(value)        # The setter method for @x
    @x = value
  end

  def y=(value)        # The setter method for @y
    @y = value
  end
end
p = Point.new(1,1)
p.x = 0
p.y = 0
*************
-
class MutablePoint
  def initialize(x,y); @x, @y = x, y; end

  def x; @x; end       # The getter method for @x
  def y; @y; end       # The getter method for @y

  def x=(value)        # The setter method for @x
    @x = value
  end

  def y=(value)        # The setter method for @y
    @y = value
  end
end
p = MutablePoint.new(1,1)
p.x = 0
p.y = 0

puts ; out1 = gets 
print %^
*************
---------------------------
class Point
  attr_accessor :x, :y # Define accessor methods for our instance variables
end		       # accessor methods mean both getter and setter methods
---------------------------
class Point
  attr_reader :x, :y  # Define reader methods for our instance variables
end		      # getter method only
---------------------------
attr_reader "x", "y"  # these methods accepts strings also
---------------------------
attr :x        # Define a trivial getter method x for @x
attr :y, true  # Define getter and setter methods for @y
---------------------------

# The attr methods are defined in the Module class. All classes are Modules 
# Class Class is a subclass of Module.
#
# The attr,attr_reader and attr_accessor methods create instance methods for us.
# This is an example of metaprogramming, and the ability to do it is a powerful
# feature of Ruby.
#
*************
^
class Point
  attr_accessor :x, :y # Define accessor methods for our instance variables
end
class Point
  attr_reader :x, :y  # Define reader methods for our instance variables
end

puts ; out1 = gets 
print %^
************* Defining Operators

class Point
  attr_reader :x, :y   # Define accessor methods for our instance variables

  def initialize(x,y)
    @x,@y = x, y
  end

  def +(other)         # Define + to do vector addition
    Point.new(@x + other.x, @y + other.y)
  end

  def -@               # Define unary minus to negate both coordinates
    Point.new(-@x, -@y) # Ruby uses -@ syntax to define unary minus method
  end			# but usage is - only i.e -Point(2,3)

  def *(scalar)        # Define * to perform scalar multiplication
    Point.new(@x*scalar, @y*scalar)
  end
end
*************
^
class Point
  attr_reader :x, :y   # Define accessor methods for our instance variables

  def initialize(x,y)
    @x,@y = x, y
  end

  def +(other)         # Define + to do vector addition
    Point.new(@x + other.x, @y + other.y)
  end

  def -@               # Define unary minus to negate both coordinates
    Point.new(-@x, -@y) 
  end		

  def *(scalar)        # Define * to perform scalar multiplication
    Point.new(@x*scalar, @y*scalar)
  end
end

puts ; out1 = gets 
p = -Point.new(2,4) 
#print  p.x, p.y
print %^
************* #Duck Typing
---------------------------
#If we pass an object to + that is not suitable, results in this message

NoMethodError: undefined method `x' for 3:Fixnum
        from ./point.rb:37:in `+'
---------------------------
def +(other)
  raise TypeError, "Point argument expected" unless other.is_a? Point
  Point.new(@x + other.x, @y + other.y)
end
---------------------------
def +(other)
  raise TypeError, "Point-like argument expected" unless
    other.respond_to? :x and other.respond_to? :y
  Point.new(@x + other.x, @y + other.y)
end
---------------------------
def +(other)         # Assume that other looks like a Point
  Point.new(@x + other.x, @y + other.y)
rescue               # If anything goes wrong above
  raise TypeError,   # Then raise our own exception
    "Point addition with an argument that does not quack like a Point!"
end
---------------------------
^
puts ; out1 = gets 
print %^
************* #Duck Typing
# Numeric types define a conversion operator named coerce.
# The inetent of this method is to convert the argument to invoked object.
#  1.5.coerce(1) returns [1.0, 1.5]
# The return value is always an array with converted argument as the first value
# and the invoked object as the second value
#
# Numeric operators are defined in such a way that if they don't know the type 
# of the righthand operator, they invoke the coerce of the rhs operand. Then 
# the operator is invoked on the return array values.
#
# If we try passing a Point to the * method of an Integer, it will call
# this method on the Point and then will try to multiply the elements of 
# the returned array. Instead of doing type conversion, we switch the order of
# the operands, so that we invoke the * method defined above.
def coerce(other)
  [self, other]
end

# Numeric operators are written so that if they don't know the right
# hand side operator, they invoke the coerce method of the right hand operand
# passing the lefthand operand as an argument. 
*************
^
puts ; out1 = gets 
print %^
*************
#Ruby uses square brackets for array and hash access, and allows any class to define a [] method and use these brackets well.

# Define [] method to allow a Point to look like an array or
# a hash with keys :x and :y
def [](index)
  case index
  when 0, -2: @x         # Index 0 (or -2) is the X coordinate
  when 1, -1: @y         # Index 1 (or -1) is the Y coordinate
  when :x, "x": @x       # Hash keys as symbol or string for X
  when :y, "y": @y       # Hash keys as symbol or string for Y
  else nil               # Arrays and hashes just return nil on bad indexes
  end
end
*************
^
puts ; out1 = gets 
print %^
*************
# This iterator passes the X coordinate to the associated block, and then
# passes the Y coordinate, and then returns. It allows us to enumerate
# a point as if it were an array with two elements. This each method is
# required by the Enumerable module.
def each
  yield @x
  yield @y
end
---------------------------
p = Point.new(1,2)
p.each {|x| print x }   # Prints "12"
---------------------------
# Most importantly, defining each iterator allows us to mix in module 
# of Enumerable module, all (about 20) of which are defined in terms of each

include Enumerable
---------------------------
---------------------------
# Is the point P at the origin?
p.all? {|x| x == 0 } # True if the block is true for all elements
---------------------------
*************
^
puts ; out1 = gets 
print %^
*************
#  Ruby defines three operator for equality test: equal?, ==, eql?
#  In Object Class, == and eql?  are synonyms for equal?
#  which tests whether two object references are same.
#
# By convention, subclasses never override equal?
#
# Most classes override == to allow different instances to be tested for equality 
# eql? is overidden for a stricter version of ==
#
# If eql? is defined, #hash should also be defined. Because eql? is used for
# hashes. If two objects are equal as per eql?, their #hash methods must return
# the same value.
^
puts ; out1 = gets 
print %^
def ==(o)               # Is self == o?
  if o.is_a? Point      # If o is a Point object
    @x==o.x && @y==o.y  # then compare the fields.
  elsif                 # If o is not a Point
    false               # then, by definition, self != o.
  end
end
---------------------------
def ==(o)                  # Is self == o?
  @x == o.x && @y == o.y   # Assume o has proper x and y methods
rescue                     # If that assumption fails
  false                    # Then self != o
end
---------------------------
class Point
  alias eql? ==
end
---------------------------
def eql?(o)             
  if o.instance_of? Point      
    @x.eql?(o.x) && @y.eql?(o.y)
  elsif
    false
  end
end
*************
^
puts ; out1 = gets 
print %^
*************
# The following has code is not a good one as it returns the same hashcode for
# (0,1) and (1,0)

def hash
  @x.hash + @y.hash
end
---------------------------
# This general-purpose should be good enough for most Ruby classes
def hash
  code = 17
  code = 37*code + @x.hash
  code = 37*code + @y.hash
  # Add lines like this for each significant instance variable
  code  # Return the resulting code
end
*************
^
puts ; out1 = gets 
print %^
*************
include Comparable   # Mix in methods from the Comparable module.

# Define an ordering for points based on their distance from the origin.
# This method is required by the Comparable module.
#
# <=> works : self < other returns -1, == returns 0, > returns 1

def <=>(other)
  return nil unless other.instance_of? Point
  @x**2 + @y**2 <=> other.x**2 + other.y**2
end
---------------------------
# all other operators ==,>,< and sort,min,max gets defined if you have defined
# <=> operator and have mixed in Comparable

p,q = Point.new(1,0), Point.new(0,1)
p == q        # => false: p is not equal to q
p < q         # => false: p is not less than q
p > q         # => false: p is not greater than q
---------------------------
attr_accessor :x, :y
*************
^
puts ; out1 = gets 
print %^
*************
def add!(p)          # Add p to self, return modified self
  @x += p.x
  @y += p.y
  self
end
---------------------------
def add(p)           # A nonmutating version of add!
  q = self.dup       # Make a copy of self
  q.add!(p)          # Invoke the mutating method on the copy
end
*************
^
puts ; out1 = gets 
print %^
*************
# A curious fact about Ruby classes: if you assign an unamed class to
# a constant, the name of that constant becomes the class name.

C = Class.new   # A new class with no body, assigned to a constant
                # the name of the constant becomes the name of the class
c = C.new       # Create an instance of the class
c.class.to_s    # => "C": constant name becomes class name

Point = Struct.new("Point",:x, :y)   # Create new class Struct::Point
Point = Struct.new(:x, :y)   # Create new class, assign to Point

# Struct is a core Ruby class that generate other classes with accessor methods
# for the named fields.
---------------------------
p = Point.new(1,2)   # => #<struct Point x=1, y=2>
p.x                  # => 1 
p.y                  # => 2
p.x = 3              # => 3
p.x                  # => 3
---------------------------
^
puts ; out1 = gets 
print %^
*************
# Struct also define [] and []= operators for array and hash style indexing
# to access instance variables. Also, defines each operators for looping through# instance variables.

p[:x] = 4             # => 4: same as p.x =
p[:x]                 # => 4: same as p.x
p[1]                  # => 2: same as p.y
p.each {|c| print c}  # prints "42"
p.each_pair {|n,c| print n,c }   # prints "x4y2"
---------------------------
q = Point.new(4,2)
q == p        # => true
h = {q => 1}  # Create a hash using q as a key
h[p]          # => 1: extract value using p as key
q.to_s        # => "#<struct Point x=4, y=2>"
*************
^
puts ; out1 = gets 
print %^
*************
# You can open the class and add methods
Point = Struct.new(:x, :y)   # Create new class, assign to Point
class Point                  # Open Point class for new methods
  def add!(other)            # Define an add! method
    self.x += other.x
    self.y += other.y
    self
  end

  include Comparable         # Include a module for the class
  def <=>(other)             # Define the <=> operator
    return nil unless other.instance_of? Point
    self.x**2 + self.y**2 <=> other.x**2 + other.y**2
  end
end
---------------------------
# You can make it immutable by undefining mutator methods
Point = Struct.new(:x, :y)  # Define mutable class
class Point                 # Open the class
  undef x=,y=,[]=           # Undefine mutator methods
end
*************
^
puts ; out1 = gets 
print %^
************* Class Methods ********

total = Point.sum(p1, p2, p3)  # p1, p2 and p3 are Point objects

class Point
  attr_reader :x, :y     # Define accessor methods for our instance variables

  def Point.sum(*points) # Return the sum of an arbitrary number of points
    x = y = 0
    points.each {|p| x += p.x; y += p.y }
    Point.new(x,y)
  end

  # ...the rest of class omitted here...
end
---------------------------
# Class methods can also be defined using self instead of class name

def self.sum(*points)  # Return the sum of an arbitrary number of points
  x = y = 0
  points.each {|p| x += p.x; y += p.y }
  Point.new(x,y)
end
---------------------------

# To define a class method, you are really defining a singleton method of the 
# Point object.

^
puts ; out1 = gets 
print %^
*************
# Open up the Point object so we can add methods to it
class << Point      # Syntax for adding methods to a single object
  def sum(*points)  # This is the class method Point.sum
    x = y = 0
    points.each {|p| x += p.x; y += p.y }
    Point.new(x,y)
  end

  # Other class methods can be defined here
end
---------------------------
# Also class methods can be defined as

class Point
  # Instance methods go here

  class << self
    # Class methods go here
  end
end
*************
^
puts ; out1 = gets 
print %^
*************CONSTANTS***************
---------------------------
class Point
  def initialize(x,y)  # Initialize method
    @x,@y = x, y 
  end

  ORIGIN = Point.new(0,0)
  UNIT_X = Point.new(1,0)
  UNIT_Y = Point.new(0,1)

# if you are using the class instances itself to define Constants, place them
# after initialize

  # Rest of class definition goes here
end
---------------------------
# You can access the constants from outside the class

Point::UNIT_X + Point::UNIT_Y   # => (1,1)
---------------------------
# You can define a constant also from outside the class

Point::NEGATIVE_UNIT_X = Point.new(-1,0)
*************
^
puts ; out1 = gets 
print %^
************* Class VARIABLES *************
# Class variables are visible to, and shared by, the class methods, instance methods and by the class definition itself.

class Point
  # Initialize our class variables in the class definition itself
  @@n = 0              # How many points have been created
  @@totalX = 0         # The sum of all X coordinates
  @@totalY = 0         # The sum of all Y coordinates

  def initialize(x,y)  # Initialize method
    @x,@y = x, y       # Sets initial values for instance variables

    # Use the class variables in this instance method to collect data
    @@n += 1           # Keep track of how many Points have been created
    @@totalX += x      # Add these coordinates to the totals
    @@totalY += y
  end

  # A class method to report the data we collected
  def self.report
    # Here we use the class variables in a class method
    puts "Number of points created: \#@@n"
    puts "Average X coordinate: \#{@@totalX.to_f/@@n}"
    puts "Average Y coordinate: \#{@@totalY.to_f/@@n}"
  end
end
*************
^
puts ; out1 = gets 
print %^
****************Class Instance Variables *************
# An instance variable used inside a class definition but outside an instance
# method definition is a class instance variable.

# They can not be used within instance methods as Class variables can.
^
puts ; out1 = gets 
print %^
****************Class Instance Variables *************

class Point
  # Initialize our class instance variables in the class definition itself
  @n = 0              # How many points have been created
  @totalX = 0         # The sum of all X coordinates
  @totalY = 0         # The sum of all Y coordinates

  def initialize(x,y) # Initialize method 
    @x,@y = x, y      # Sets initial values for instance variables
  end

  def self.new(x,y)   # Class method to create new Point objects
    # Use the class instance variables in this class method to collect data
    @n += 1           # Keep track of how many Points have been created
    @totalX += x      # Add these coordinates to the totals
    @totalY += y

    super             # Invoke the real definition of new to create a Point
                      # More about super later in the chapter
  end

  # A class method to report the data we collected
  def self.report
    # Here we use the class instance variables in a class method
    puts "Number of points created: \#@n"
    puts "Average X coordinate: \#{@totalX.to_f/@n}"
    puts "Average Y coordinate: \#{@totalY.to_f/@n}"
  end
end

# Instance variables are always evaluated with reference to self. That is why an# instance variable reference within class definition or class method is 
# completely different from an instance variable reference within instance methods.
# First is Class instance varibales, second is normal instance variables.
^
puts ; out1 = gets 
print %^

# To create accessor methods for class instance variables
class << self
  attr_accessor :n, :totalX, :totalY
end
*************
^
puts ; out1 = gets 
print %^
************* Method Visibility *********************
class Point
  # public methods go here

  # The following methods are protected
  protected

  # protected methods go here

  # The following methods are private
  private

  # private methods go here
end

# Methods are normally public unless they are made protected or private.
# private methods can only be invoked in functional style by other 
# instance methods of the class. 
# initialize method is always implicitly private
# Protected methods can only be called from class or its subclass.
# Protected methods are least commonly used and diffcult to understand

*************
^
puts ; out1 = gets 
print %^
*************
---------------------------
class Point
  # public methods go here

  # The following methods are protected
  protected

  # protected methods go here

  # The following methods are private
  private

  # private methods go here
end
---------------------------
class Widget
  def x                       # Accessor method for @x
    @x
  end
  protected :x                # Make it protected

  def utility_method          # Define a method
    nil
  end
  private :utility_method     # And make it private
end

# public, private, protected applies to instance methods only
# private_class_method and public_class_method apllies to class method
---------------------------
# It is sometime useful to make class method new private like in Factory methods

private_class_method :new
---------------------------
# But metaprogamming capabilty can let you do anything irrespective of the 
# privacy settings

w = Widget.new                      # Create a Widget
w.send :utility_method              # Invoke private method!
w.instance_eval { utility_method }  # Another way to invoke it
w.instance_eval { @x }              # Read instance variable of w
---------------------------
*************
^
puts ; out1 = gets 
print %^
************* Subclassing And Inheritance ****************
# if superclass is not defined, class automatically extends Object

## In Ruby, Initalize is an ordinary private method and is inherited like any other.
## Private methods are inherited by sub-classes which means that 
## subclasses can override them and invoke them.
#
# You should only subclass if you are familiar with superclass's implementation.
# Otherwise, extend the functionality by encapsulating and delegating to it.

class Point3D < Point    # Define class Point3D as a subclass of Point
end
---------------------------
class Point3D < Struct.new("Point3D", :x, :y, :z)
  # Superclass struct gives us accessor methods, ==, to_s, etc.
  # Add point-specific methods here
end
---------------------------
p2 = Point.new(1,2)
p3 = Point3D.new(1,2)
print p2.to_s, p2.class   # prints "(1,2)Point"
print p3.to_s, p3.class   # prints "(1,2)Point3D"
---------------------------

^
puts ; out1 = gets 
print %^
**************Overriding Methods****************************
o = Object.new
puts o.to_s      # Prints something like "#<Object:0xb7f7fce4>"

#In 1.9 Object inherits from BasicObject which has almost no methods
*************
---------------------------
# Greet the World
class WorldGreeter
  def greet                      # Display a greeting
    puts "\#{greeting} \#{who}"
  end

  def greeting                   # What greeting to use
    "Hello"
  end

  def who                        # Who to greet
    "World"
  end
end

# Greet the world in Spanish
class SpanishWorldGreeter < WorldGreeter
  def greeting                   # Override the greeting
    "Hola"
  end
end

# We call a method defined in WorldGreeter, which calls the overridden
# version of greeting in SpanishWorldGreeter, and prints "Hola World"
SpanishWorldGreeter.new.greet
*************
^
puts ; out1 = gets 
print %^
*************
# This class is abstract; it doesn't define greeting or who
# No special syntax is required: any class that invokes methods that are
# intended for a subclass to implement is abstract.
class AbstractGreeter
  def greet
    puts "\#{greeting} \#{who}"
  end
end

# A concrete subclass
class WorldGreeter < AbstractGreeter
  def greeting; "Hello"; end
  def who; "World"; end
end

WorldGreeter.new.greet  # Displays "Hello World"
*************

******************Overriding Private Methods***********
# Private methods can not be invoked from outside the class that defines it
# But they are inherited by Subclasses, this means subclasses can invoke them or override them
# Be careful when you are subclassing a class that you have not read the source code
# Read Pg 232
^
puts ; out1 = gets 
print %^
************* Augmenting Behavior by chaining **********
# super  works like a special method invocation of same name in the superclass
# super, as a bare keyword without arguments, will invoke the method in the 
#        superclass with the same name as the current one with all the current
#        arguments

class Point3D < Point
  def initialize(x,y,z)
    # Pass our first two arguments along to the superclass initialize method
    super(x,y)
    # And deal with the third argument ourself
    @z = z;
  end
end
---------------------------
class Point3D < Point
  def initialize(x,y,z)
    super(x,y)
    @z = z;
  end

  def to_s
    "(\#@x, \#@y, \#@z)"  # Variables @x and @y inherited?
  end
end
---------------------------
Point3D.new(1,2,3).to_s  # => "(1, 2, 3)"
*************
^
puts ; out1 = gets 
print %^
*************
class A
  @@value = 1                   # A class variable
  def A.value; @@value; end     # An accessor method for it
end
print A.value                   # Display value of A's class variable
class B < A; @@value = 2; end   # Subclass alters shared class variable
print A.value                   # Superclass sees altered value
class C < A; @@value = 3; end   # Another alters shared variable again
print B.value                   # 1st subclass sees value from 2nd subclass
---------------------------
ORIGIN = Point3D.new(0,0,0)
---------------------------
*************
^
puts ; out1 = gets 
print %^
************* Object Creation and Initialization *****************
# Evey Class inherits the method #new and #allocate.
# If new is written in Ruby, it would be

def new(*args)
  o = self.allocate   # Create a new object of this class
  o.initialize(*args) # Call the object's initialize method with our args
  o                   # Return new object; ignore return value of initialize
end

# Ruby impicitly makes initalize private which means you can not explicitly
# invoke initialze on an object.
# Every class that extends another class should use super to chain initialize 
# methods of the superclasses.

***********
^
print %^
---------------------------
class Point
  # Initialize a Point with two or three coordinates
  def initialize(x, y, z=nil)
    @x,@y,@z = x, y, z
  end
end
*************
^
puts ; out1 = gets 
print %^
************* Factory Methods***************
# To allow initialization of instances in more than one way by making #new private

class Point
  # Define an initialize method as usual...
  def initialize(x,y)  # Expects Cartesian coordinates
    @x,@y = x,y
  end

  # But make the factory method new private
  private_class_method :new

  def Point.cartesian(x,y)  # Factory method for Cartesian coordinates
    new(x,y)  # We can still call new from other class methods
  end

  def Point.polar(r, theta) # Factory method for polar coordinates
    new(r*Math.cos(theta), r*Math.sin(theta))
  end
end
*************
^
puts ; out1 = gets 
print %^
************* dup, clone and initialize_copy **********
# Other ways that object come into existence are due to dup and clone methods.
# clone also copies singleton methods and freezes the object if original is frozen.
# if a class defines initialize_copy, then clone and dup will invoke that method
# on the copied object after copying the instance varibales of the original.

class Point                 # A point in n-space
  def initialize(*coords)   # Accept an arbitrary # of coordinates
    @coords = coords        # Store the coordinates in an array
  end

  def initialize_copy(orig) # If someone copies this Point object
    @coords = @coords.dup   # Make a copy of the coordinates array, too
  end
end

# Some classes would like to restrict the number of instances. They should make
# new, allocate, dup, clone private

class Season
  NAMES = %w{ Spring Summer Autumn Winter }  # Array of season names
  INSTANCES = []                             # Array of Season objects

  def initialize(n)  # The state of a season is just its 
    @n = n           # index in the NAMES and INSTANCES arrays
  end

  def to_s           # Return the name of a season 
    NAMES[@n]
  end

  # This code creates instances of this class to represent the seasons 
  # and defines constants to refer to those instances.
  # Note that we must do this after initialize is defined.
  NAMES.each_with_index do |name,index|
    instance = new(index)         # Create a new instance
    INSTANCES[index] = instance   # Save it in an array of instances
    const_set name, instance      # Define a constant to refer to it
  end

  # Now that we have created all the instances we'll ever need, we must
  # prevent any other instances from being created
  private_class_method :new,:allocate  # Make the factory methods private
  private :dup, :clone                 # Make copying methods private
end
*************
^
puts ; out1 = gets 
print %^
*************
class Point                  # A point in n-space
  def initialize(*coords)    # Accept an arbitrary # of coordinates
    @coords = coords         # Store the coordinates in an array
  end

  def marshal_dump           # Pack coords into a string and marshal that
    @coords.pack("w*")
  end

  def marshal_load(s)        # Unpack coords from unmarshaled string
    @coords = s.unpack("w*") # and use them to initialize the object
  end
end
---------------------------
class Season
  # We want to allow Season objects to be marshaled, but we don't
  # want new instances to be created when they are unmarshaled.
  def _dump(limit)         # Custom marshaling method
    @n.to_s                # Return index as a string
  end

  def self._load(s)        # Custom unmarshaling method
    INSTANCES[Integer(s)]  # Return an existing instance
  end
end
*************
^
puts ; out1 = gets 
print %^
****************Singleton Pattern *************
# A singleton is a class that has only a single instance.
# Singleton module dos this for us 
# It defines a class method instance that returns the single instance

require 'singleton'           # Singleton module is not built-in

class PointStats              # Define a class
  include Singleton           # Make it a singleton

  def initialize              # A normal initialization method
    @n, @totalX, @totalY = 0, 0.0, 0.0
  end

  def record(point)           # Record a new point
    @n += 1
    @totalX += point.x
    @totalY += point.y
  end

  def report                  # Report point statistics
    puts "Number of points created: \#@n"
    puts "Average X coordinate: \#{@totalX/@n}"
    puts "Average Y coordinate: \#{@totalY/@n}"
  end
end
^
puts ; out1 = gets 
print %^
---------------------------
def initialize(x,y)
  @x,@y = x,y
  PointStats.instance.record(self)
end
---------------------------
PointStats.instance.report
*************
^
puts ; out1 = gets 
print %^
************* Modules ******************
************* Module as namespace******************
# Module is a subclass of Class , but Module can not be instantiated or subclassed
# Modules are used as namespaces and mixins

# Just as a class object is an instance of Class, a module object is an instance of Module
# Class is subclass of Module
# All classes are Modules, but not all modules are Classes
# Classes can be used as namespace, but not as mixins like Modules

# Module as namespace

def base64_encode
end

def base64_decode
end

module Base64
  def self.encode
  end

  def self.decode
  end
end

# Note that this defines methods as the class methods of the module
---------------------------
module Base64
  def Base64.encode
  end

  def Base64.decode
  end
end
---------------------------
# This is how we invoke the methods of the Base64 module
text = Base64.encode(data)
data = Base64.decode(text)
*************
^
puts ; out1 = gets 
print %^
************* Module as nested  namespace

module Base64
  DIGITS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' \
           'abcdefghijklmnopqrstuvwxyz' \
           '0123456789+/'
end
---------------------------
module Base64
  DIGITS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

  class Encoder
    def encode
    end
  end

  class Decoder
    def decode
    end
  end

  # A utility function for use by both classes
  def Base64.helper
  end
end
# 
*************
^
puts ; out1 = gets 
print %^
************* Module as mixins ***************

# If module defines instance methods, those instance methods can be mixed in 
# to other classes.
# Eneumerable and Comprabale are well-known examples

class Point
  include(Comparable)
end
---------------------------
include Enumerable, Comparable
---------------------------
"text".is_a? Comparable         # => true
Enumerable === "text"           # => true in Ruby 1.8, false in 1.9
---------------------------
"text".instance_of? Comparable  # => false
---------------------------
module Iterable       # Classes that define next can include this module
  include Enumerable          # Define iterators on top of each
  def each                    # And define each on top of next
    loop { yield self.next }
  end
end
^
puts ; out1 = gets 
print %^
---------------------------
# You can use extend also to mix-n a module

countdown = Object.new       # A plain old object
def countdown.each           # The each iterator as a singleton method
  yield 3
  yield 2
  yield 1
end
countdown.extend(Enumerable) # Now the object has all Enumerable methods  
print countdown.sort         # Prints "[1, 2, 3]"
---------------------------
****** Includable Namespace modules ************
# It is posssible to define a namespace that you use generally with require
# But, to use it as includable module i.e the methods to be mixed in' define
# your methods as instance methods and then use module_function to convert those# methods as "module function" ...Read pg no 252
 
Math.sin(0)    # => 0.0: Math is a namespace 
include 'Math' # The Math namespace can be included
sin(0)         # => 0.0: Now we have easy access to the functions
*************
^
puts ; out1 = gets 
print %^
************* Loading and Requiring Modules **************
# require and load are used to load in files
# require can also load binary extensions like .so or .dll
# load expects a complete path name including extension
# require needs only basename i.e filename without extension
# load can load the same file multiple times, require avoids it
---------------------------
# $LOAD_PATH or $: are arrays that you can access that contain the directories 
# that Ruby seraches for files to load

# Here is a typical value in 1.8 by ruby -e ' puts $:'

/usr/lib/site_ruby/1.8
/usr/lib/site_ruby/1.8/i386-linux
/usr/lib/site_ruby
/usr/lib/ruby/1.8
/usr/lib/ruby/1.8/i386-linux
.
^
puts ; out1 = gets 
print %^
---------------------------
# Here is a typical value in 1.9 by ruby -e ' puts $:'

/usr/local/lib/ruby/gems/1.9/gems/rake-0.7.3/lib
/usr/local/lib/ruby/gems/1.9/gems/rake-0.7.3/bin
/usr/local/lib/ruby/site_ruby/1.9
/usr/local/lib/ruby/site_ruby/1.9/i686-linux
/usr/local/lib/ruby/site_ruby
/usr/local/lib/ruby/vendor_ruby/1.9
/usr/local/lib/ruby/vendor_ruby/1.9/i686-linux
/usr/local/lib/ruby/vendor_ruby
/usr/local/lib/ruby/1.9
/usr/local/lib/ruby/1.9/i686-linux
.
---------------------------
^
puts ; out1 = gets 
print %^
# Ruby programs can modify their own load path

# Remove the current directory from the load path
$:.pop if $:.last == '.'  

# Add the installation directory for the current program to 
# the beginning of the load path
$LOAD_PATH.unshift File.expand_path($PROGRAM_NAME)

# Add the value of an environment variable to the end of the path
$LOAD_PATH << ENV['MY_LIBRARY_DIRECTORY']
---------------------------
$Util = Util   # Store a reference to this module in a global variable
---------------------------
if Module.nesting.size > 0       # If we're loaded into a wrapper module
  $wrapper = Module.nesting[0]   # Pass the module back to the loading code
end
-------Autoloading Modules--------------------
# Require 'socket' if and when the TCPSocket is first used
autoload :TCPSocket, "socket"
*************
^
puts ; out1 = gets 
print %^
************* Singleton Methods and Eigen Class *************
Singleton methods are defined for only single objects rather than a class of objects.
The class methods are nothing more than singleton methods on the Class instance that represents that class.
The singleton methods of an object are instance methods of the anonymous
eigenclass associated with that object.
The eigenclass is also called singleton class or the metaclass.

Ruby defines a syntax for opening the eigenclass of an object and adding methodsto it.
To open an eigen class use class << o.
---------------------------
# To define a singleton class on any object

def Point.sum
  # Method body goes here
end
---------------------------
# using the class << o syntax

class << Point
  def class_method1      # This is an instance method of the eigenclass.
  end                    # It is also a class method of Point.

  def class_method2
  end
end
---------------------------
class Point
  # instance methods go here

  class << self
    # class methods go here as instance methods of the eigenclass
    # inside a class you can use self instead of classname , class << Point
  end
end
---------------------------
class Point            # Create or open the class Point
class Point3D < Point  # Create a subclass of Point
class << Point         # Open the eigenclass of the object Point
*************
^
puts ; out1 = gets 
print %^
*************
---------------------------
eigenclass = class << o; self; end
---------------------------
class Object
  def eigenclass
    class << self; self; end
  end
end
---------------------------
message = "hello"
message.world
---------------------------
NoMethodError: undefined method `world' for "hello":String
---------------------------
class C
end
---------------------------
c = C.new
---------------------------
def Integer.parse(text)
  text.to_i
end
---------------------------
n = Fixnum.parse("1")
*************
^
puts ; out1 = gets 
print %^
*************
Constant Lookup
*************
^
require  "./scope_ch7.rb"
puts ; out1 = gets 
print %^
*************
*************
^
puts ; out1 = gets 
__END__

class Point
end
---------------------------
p = Point.new
---------------------------
p.class       # => Point
p.is_a? Point # => true
---------------------------
class Point
  def initialize(x,y)
    @x, @y = x, y
  end
end
---------------------------
p = Point.new(0,0)
---------------------------
# Incorrect code!
class Point
  @x = 0   # Create instance variable @x and assign a default. WRONG!
  @y = 0   # Create instance variable @y and assign a default. WRONG!

  def initialize(x,y)
    @x, @y = x, y   # Now initialize previously created @x and @y.
  end
end
---------------------------
class Point
  def initialize(x,y)
    @x, @y = x, y
  end

  def to_s        # Return a String that represents this point
    "(#@x,#@y)"   # Just interpolate the instance variables into a string
  end
end
---------------------------
p = new Point(1,2)   # Create a new Point object
puts p               # Displays "(1,2)"
---------------------------
class Point
  def initialize(x,y)
    @x, @y = x, y
  end

  def x           # The accessor (or getter) method for @x
    @x
  end

  def y           # The accessor method for @y
    @y
  end
end
---------------------------
p = Point.new(1,2)
q = Point.new(p.x*2, p.y*3)
---------------------------
class MutablePoint
  def initialize(x,y); @x, @y = x, y; end

  def x; @x; end       # The getter method for @x
  def y; @y; end       # The getter method for @y

  def x=(value)        # The setter method for @x
    @x = value
  end

  def y=(value)        # The setter method for @y
    @y = value
  end
end
---------------------------
p = Point.new(1,1)
p.x = 0
p.y = 0
---------------------------
class Point
  attr_accessor :x, :y # Define accessor methods for our instance variables
end
---------------------------
class Point
  attr_reader :x, :y  # Define reader methods for our instance variables
end
---------------------------
attr_reader "x", "y"
---------------------------
attr :x        # Define a trivial getter method x for @x
attr :y, true  # Define getter and setter methods for @y
---------------------------
class Point
  attr_reader :x, :y   # Define accessor methods for our instance variables

  def initialize(x,y)
    @x,@y = x, y
  end

  def +(other)         # Define + to do vector addition
    Point.new(@x + other.x, @y + other.y)
  end

  def -@               # Define unary minus to negate both coordinates
    Point.new(-@x, -@y)
  end

  def *(scalar)        # Define * to perform scalar multiplication
    Point.new(@x*scalar, @y*scalar)
  end
end
---------------------------
NoMethodError: undefined method `x' for 3:Fixnum
        from ./point.rb:37:in `+'
---------------------------
def +(other)
  raise TypeError, "Point argument expected" unless other.is_a? Point
  Point.new(@x + other.x, @y + other.y)
end
---------------------------
def +(other)
  raise TypeError, "Point-like argument expected" unless
    other.respond_to? :x and other.respond_to? :y
  Point.new(@x + other.x, @y + other.y)
end
---------------------------
def +(other)         # Assume that other looks like a Point
  Point.new(@x + other.x, @y + other.y)
rescue               # If anything goes wrong above
  raise TypeError,   # Then raise our own exception
    "Point addition with an argument that does not quack like a Point!"
end
---------------------------
# If we try passing a Point to the * method of an Integer, it will call
# this method on the Point and then will try to multiply the elements of 
# the array. Instead of doing type conversion, we switch the order of
# the operands, so that we invoke the * method defined above.
def coerce(other)
  [self, other]
end
---------------------------
# Define [] method to allow a Point to look like an array or
# a hash with keys :x and :y
def [](index)
  case index
  when 0, -2: @x         # Index 0 (or -2) is the X coordinate
  when 1, -1: @y         # Index 1 (or -1) is the Y coordinate
  when :x, "x": @x       # Hash keys as symbol or string for X
  when :y, "y": @y       # Hash keys as symbol or string for Y
  else nil               # Arrays and hashes just return nil on bad indexes
  end
end
---------------------------
# This iterator passes the X coordinate to the associated block, and then
# passes the Y coordinate, and then returns. It allows us to enumerate
# a point as if it were an array with two elements. This each method is
# required by the Enumerable module.
def each
  yield @x
  yield @y
end
---------------------------
p = Point.new(1,2)
p.each {|x| print x }   # Prints "12"
---------------------------
include Enumerable
---------------------------
# Is the point P at the origin?
p.all? {|x| x == 0 } # True if the block is true for all elements
---------------------------
def ==(o)               # Is self == o?
  if o.is_a? Point      # If o is a Point object
    @x==o.x && @y==o.y  # then compare the fields.
  elsif                 # If o is not a Point
    false               # then, by definition, self != o.
  end
end
---------------------------
def ==(o)                  # Is self == o?
  @x == o.x && @y == o.y   # Assume o has proper x and y methods
rescue                     # If that assumption fails
  false                    # Then self != o
end
---------------------------
class Point
  alias eql? ==
end
---------------------------
def eql?(o)             
  if o.instance_of? Point      
    @x.eql?(o.x) && @y.eql?(o.y)
  elsif
    false
  end
end
---------------------------
def hash
  @x.hash + @y.hash
end
---------------------------
def hash
  code = 17
  code = 37*code + @x.hash
  code = 37*code + @y.hash
  # Add lines like this for each significant instance variable
  code  # Return the resulting code
end
---------------------------
include Comparable   # Mix in methods from the Comparable module.

# Define an ordering for points based on their distance from the origin.
# This method is required by the Comparable module.
def <=>(other)
  return nil unless other.instance_of? Point
  @x**2 + @y**2 <=> other.x**2 + other.y**2
end
---------------------------
p,q = Point.new(1,0), Point.new(0,1)
p == q        # => false: p is not equal to q
p < q         # => false: p is not less than q
p > q         # => false: p is not greater than q
---------------------------
attr_accessor :x, :y
---------------------------
def add!(p)          # Add p to self, return modified self
  @x += p.x
  @y += p.y
  self
end
---------------------------
def add(p)           # A nonmutating version of add!
  q = self.dup       # Make a copy of self
  q.add!(p)          # Invoke the mutating method on the copy
end
---------------------------
Struct.new("Point", :x, :y)  # Creates new class Struct::Point
Point = Struct.new(:x, :y)   # Creates new class, assigns to Point
---------------------------
C = Class.new   # A new class with no body, assigned to a constant
c = C.new       # Create an instance of the class
c.class.to_s    # => "C": constant name becomes class name
---------------------------
p = Point.new(1,2)   # => #<struct Point x=1, y=2>
p.x                  # => 1 
p.y                  # => 2
p.x = 3              # => 3
p.x                  # => 3
---------------------------
p[:x] = 4             # => 4: same as p.x =
p[:x]                 # => 4: same as p.x
p[1]                  # => 2: same as p.y
p.each {|c| print c}  # prints "42"
p.each_pair {|n,c| print n,c }   # prints "x4y2"
---------------------------
q = Point.new(4,2)
q == p        # => true
h = {q => 1}  # Create a hash using q as a key
h[p]          # => 1: extract value using p as key
q.to_s        # => "#<struct Point x=4, y=2>"
---------------------------
Point = Struct.new(:x, :y)   # Create new class, assign to Point
class Point                  # Open Point class for new methods
  def add!(other)            # Define an add! method
    self.x += other.x
    self.y += other.y
    self
  end

  include Comparable         # Include a module for the class
  def <=>(other)             # Define the <=> operator
    return nil unless other.instance_of? Point
    self.x**2 + self.y**2 <=> other.x**2 + other.y**2
  end
end
---------------------------
Point = Struct.new(:x, :y)  # Define mutable class
class Point                 # Open the class
  undef x=,y=,[]=           # Undefine mutator methods
end
---------------------------
total = Point.sum(p1, p2, p3)  # p1, p2 and p3 are Point objects
---------------------------
class Point
  attr_reader :x, :y     # Define accessor methods for our instance variables

  def Point.sum(*points) # Return the sum of an arbitrary number of points
    x = y = 0
    points.each {|p| x += p.x; y += p.y }
    Point.new(x,y)
  end

  # ...the rest of class omitted here...
end
---------------------------
def self.sum(*points)  # Return the sum of an arbitrary number of points
  x = y = 0
  points.each {|p| x += p.x; y += p.y }
  Point.new(x,y)
end
---------------------------
# Open up the Point object so we can add methods to it
class << Point      # Syntax for adding methods to a single object
  def sum(*points)  # This is the class method Point.sum
    x = y = 0
    points.each {|p| x += p.x; y += p.y }
    Point.new(x,y)
  end

  # Other class methods can be defined here
end
---------------------------
class Point
  # Instance methods go here

  class << self
    # Class methods go here
  end
end
---------------------------
class Point
  def initialize(x,y)  # Initialize method
    @x,@y = x, y 
  end

  ORIGIN = Point.new(0,0)
  UNIT_X = Point.new(1,0)
  UNIT_Y = Point.new(0,1)

  # Rest of class definition goes here
end
---------------------------
Point::UNIT_X + Point::UNIT_Y   # => (1,1)
---------------------------
Point::NEGATIVE_UNIT_X = Point.new(-1,0)
---------------------------
class Point
  # Initialize our class variables in the class definition itself
  @@n = 0              # How many points have been created
  @@totalX = 0         # The sum of all X coordinates
  @@totalY = 0         # The sum of all Y coordinates

  def initialize(x,y)  # Initialize method
    @x,@y = x, y       # Sets initial values for instance variables

    # Use the class variables in this instance method to collect data
    @@n += 1           # Keep track of how many Points have been created
    @@totalX += x      # Add these coordinates to the totals
    @@totalY += y
  end

  # A class method to report the data we collected
  def self.report
    # Here we use the class variables in a class method
    puts "Number of points created: #@@n"
    puts "Average X coordinate: #{@@totalX.to_f/@@n}"
    puts "Average Y coordinate: #{@@totalY.to_f/@@n}"
  end
end
---------------------------
class Point
  # Initialize our class instance variables in the class definition itself
  @n = 0              # How many points have been created
  @totalX = 0         # The sum of all X coordinates
  @totalY = 0         # The sum of all Y coordinates

  def initialize(x,y) # Initialize method 
    @x,@y = x, y      # Sets initial values for instance variables
  end

  def self.new(x,y)   # Class method to create new Point objects
    # Use the class instance variables in this class method to collect data
    @n += 1           # Keep track of how many Points have been created
    @totalX += x      # Add these coordinates to the totals
    @totalY += y

    super             # Invoke the real definition of new to create a Point
                      # More about super later in the chapter
  end

  # A class method to report the data we collected
  def self.report
    # Here we use the class instance variables in a class method
    puts "Number of points created: #@n"
    puts "Average X coordinate: #{@totalX.to_f/@n}"
    puts "Average Y coordinate: #{@totalY.to_f/@n}"
  end
end
---------------------------
class << self
  attr_accessor :n, :totalX, :totalY
end
---------------------------
class Point
  # public methods go here

  # The following methods are protected
  protected

  # protected methods go here

  # The following methods are private
  private

  # private methods go here
end
---------------------------
class Widget
  def x                       # Accessor method for @x
    @x
  end
  protected :x                # Make it protected

  def utility_method          # Define a method
    nil
  end
  private :utility_method     # And make it private
end
---------------------------
private_class_method :new
---------------------------
w = Widget.new                      # Create a Widget
w.send :utility_method              # Invoke private method!
w.instance_eval { utility_method }  # Another way to invoke it
w.instance_eval { @x }              # Read instance variable of w
---------------------------
class Point3D < Point    # Define class Point3D as a subclass of Point
end
---------------------------
class Point3D < Struct.new("Point3D", :x, :y, :z)
  # Superclass struct gives us accessor methods, ==, to_s, etc.
  # Add point-specific methods here
end
---------------------------
p2 = Point.new(1,2)
p3 = Point3D.new(1,2)
print p2.to_s, p2.class   # prints "(1,2)Point"
print p3.to_s, p3.class   # prints "(1,2)Point3D"
---------------------------
o = Object.new
puts o.to_s      # Prints something like "#<Object:0xb7f7fce4>"
---------------------------
# Greet the World
class WorldGreeter
  def greet                      # Display a greeting
    puts "#{greeting} #{who}"
  end

  def greeting                   # What greeting to use
    "Hello"
  end

  def who                        # Who to greet
    "World"
  end
end

# Greet the world in Spanish
class SpanishWorldGreeter < WorldGreeter
  def greeting                   # Override the greeting
    "Hola"
  end
end

# We call a method defined in WorldGreeter, which calls the overridden
# version of greeting in SpanishWorldGreeter, and prints "Hola World"
SpanishWorldGreeter.new.greet
---------------------------
# This class is abstract; it doesn't define greeting or who
# No special syntax is required: any class that invokes methods that are
# intended for a subclass to implement is abstract.
class AbstractGreeter
  def greet
    puts "#{greeting} #{who}"
  end
end

# A concrete subclass
class WorldGreeter < AbstractGreeter
  def greeting; "Hello"; end
  def who; "World"; end
end

WorldGreeter.new.greet  # Displays "Hello World"
---------------------------
class Point3D < Point
  def initialize(x,y,z)
    # Pass our first two arguments along to the superclass initialize method
    super(x,y)
    # And deal with the third argument ourself
    @z = z;
  end
end
---------------------------
class Point3D < Point
  def initialize(x,y,z)
    super(x,y)
    @z = z;
  end

  def to_s
    "(#@x, #@y, #@z)"  # Variables @x and @y inherited?
  end
end
---------------------------
Point3D.new(1,2,3).to_s  # => "(1, 2, 3)"
---------------------------
class A
  @@value = 1                   # A class variable
  def A.value; @@value; end     # An accessor method for it
end
print A.value                   # Display value of A's class variable
class B < A; @@value = 2; end   # Subclass alters shared class variable
print A.value                   # Superclass sees altered value
class C < A; @@value = 3; end   # Another alters shared variable again
print B.value                   # 1st subclass sees value from 2nd subclass
---------------------------
ORIGIN = Point3D.new(0,0,0)
---------------------------
def new(*args)
  o = self.allocate   # Create a new object of this class
  o.initialize(*args) # Call the object's initialize method with our args
  o                   # Return new object; ignore return value of initialize
end
---------------------------
class Point
  # Initialize a Point with two or three coordinates
  def initialize(x, y, z=nil)
    @x,@y,@z = x, y, z
  end
end
---------------------------
class Point
  # Define an initialize method as usual...
  def initialize(x,y)  # Expects Cartesian coordinates
    @x,@y = x,y
  end

  # But make the factory method new private
  private_class_method :new

  def Point.cartesian(x,y)  # Factory method for Cartesian coordinates
    new(x,y)  # We can still call new from other class methods
  end

  def Point.polar(r, theta) # Factory method for polar coordinates
    new(r*Math.cos(theta), r*Math.sin(theta))
  end
end
---------------------------
class Point                 # A point in n-space
  def initialize(*coords)   # Accept an arbitrary # of coordinates
    @coords = coords        # Store the coordinates in an array
  end

  def initialize_copy(orig) # If someone copies this Point object
    @coords = @coords.dup   # Make a copy of the coordinates array, too
  end
end
---------------------------
class Season
  NAMES = %w{ Spring Summer Autumn Winter }  # Array of season names
  INSTANCES = []                             # Array of Season objects

  def initialize(n)  # The state of a season is just its 
    @n = n           # index in the NAMES and INSTANCES arrays
  end

  def to_s           # Return the name of a season 
    NAMES[@n]
  end

  # This code creates instances of this class to represent the seasons 
  # and defines constants to refer to those instances.
  # Note that we must do this after initialize is defined.
  NAMES.each_with_index do |name,index|
    instance = new(index)         # Create a new instance
    INSTANCES[index] = instance   # Save it in an array of instances
    const_set name, instance      # Define a constant to refer to it
  end

  # Now that we have created all the instances we'll ever need, we must
  # prevent any other instances from being created
  private_class_method :new,:allocate  # Make the factory methods private
  private :dup, :clone                 # Make copying methods private
end
---------------------------
class Point                  # A point in n-space
  def initialize(*coords)    # Accept an arbitrary # of coordinates
    @coords = coords         # Store the coordinates in an array
  end

  def marshal_dump           # Pack coords into a string and marshal that
    @coords.pack("w*")
  end

  def marshal_load(s)        # Unpack coords from unmarshaled string
    @coords = s.unpack("w*") # and use them to initialize the object
  end
end
---------------------------
class Season
  # We want to allow Season objects to be marshaled, but we don't
  # want new instances to be created when they are unmarshaled.
  def _dump(limit)         # Custom marshaling method
    @n.to_s                # Return index as a string
  end

  def self._load(s)        # Custom unmarshaling method
    INSTANCES[Integer(s)]  # Return an existing instance
  end
end
---------------------------
require 'singleton'           # Singleton module is not built-in

class PointStats              # Define a class
  include Singleton           # Make it a singleton

  def initialize              # A normal initialization method
    @n, @totalX, @totalY = 0, 0.0, 0.0
  end

  def record(point)           # Record a new point
    @n += 1
    @totalX += point.x
    @totalY += point.y
  end

  def report                  # Report point statistics
    puts "Number of points created: #@n"
    puts "Average X coordinate: #{@totalX/@n}"
    puts "Average Y coordinate: #{@totalY/@n}"
  end
end
---------------------------
def initialize(x,y)
  @x,@y = x,y
  PointStats.instance.record(self)
end
---------------------------
PointStats.instance.report
---------------------------
def base64_encode
end

def base64_decode
end
---------------------------
module Base64
  def self.encode
  end

  def self.decode
  end
end
---------------------------
module Base64
  def Base64.encode
  end

  def Base64.decode
  end
end
---------------------------
# This is how we invoke the methods of the Base64 module
text = Base64.encode(data)
data = Base64.decode(text)
---------------------------
module Base64
  DIGITS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' \
           'abcdefghijklmnopqrstuvwxyz' \
           '0123456789+/'
end
---------------------------
module Base64
  DIGITS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

  class Encoder
    def encode
    end
  end

  class Decoder
    def decode
    end
  end

  # A utility function for use by both classes
  def Base64.helper
  end
end
---------------------------
class Point
  include Comparable
end
---------------------------
class Point
  include(Comparable)
end
---------------------------
include Enumerable, Comparable
---------------------------
"text".is_a? Comparable         # => true
Enumerable === "text"           # => true in Ruby 1.8, false in 1.9
---------------------------
"text".instance_of? Comparable  # => false
---------------------------
module Iterable       # Classes that define next can include this module
  include Enumerable          # Define iterators on top of each
  def each                    # And define each on top of next
    loop { yield self.next }
  end
end
---------------------------
countdown = Object.new       # A plain old object
def countdown.each           # The each iterator as a singleton method
  yield 3
  yield 2
  yield 1
end
countdown.extend(Enumerable) # Now the object has all Enumerable methods  
print countdown.sort         # Prints "[1, 2, 3]"
---------------------------
Math.sin(0)    # => 0.0: Math is a namespace 
include 'Math' # The Math namespace can be included
sin(0)         # => 0.0: Now we have easy access to the functions
---------------------------
/usr/lib/site_ruby/1.8
/usr/lib/site_ruby/1.8/i386-linux
/usr/lib/site_ruby
/usr/lib/ruby/1.8
/usr/lib/ruby/1.8/i386-linux
.
---------------------------
/usr/local/lib/ruby/gems/1.9/gems/rake-0.7.3/lib
/usr/local/lib/ruby/gems/1.9/gems/rake-0.7.3/bin
/usr/local/lib/ruby/site_ruby/1.9
/usr/local/lib/ruby/site_ruby/1.9/i686-linux
/usr/local/lib/ruby/site_ruby
/usr/local/lib/ruby/vendor_ruby/1.9
/usr/local/lib/ruby/vendor_ruby/1.9/i686-linux
/usr/local/lib/ruby/vendor_ruby
/usr/local/lib/ruby/1.9
/usr/local/lib/ruby/1.9/i686-linux
.
---------------------------
# Remove the current directory from the load path
$:.pop if $:.last == '.'  

# Add the installation directory for the current program to 
# the beginning of the load path
$LOAD_PATH.unshift File.expand_path($PROGRAM_NAME)

# Add the value of an environment variable to the end of the path
$LOAD_PATH << ENV['MY_LIBRARY_DIRECTORY']
---------------------------
$Util = Util   # Store a reference to this module in a global variable
---------------------------
if Module.nesting.size > 0       # If we're loaded into a wrapper module
  $wrapper = Module.nesting[0]   # Pass the module back to the loading code
end
---------------------------
# Require 'socket' if and when the TCPSocket is first used
autoload :TCPSocket, "socket"
---------------------------
def Point.sum
  # Method body goes here
end
---------------------------
class << Point
  def class_method1      # This is an instance method of the eigenclass.
  end                    # It is also a class method of Point.

  def class_method2
  end
end
---------------------------
class Point
  # instance methods go here

  class << self
    # class methods go here as instance methods of the eigenclass
  end
end
---------------------------
class Point            # Create or open the class Point
class Point3D < Point  # Create a subclass of Point
class << Point         # Open the eigenclass of the object Point
---------------------------
eigenclass = class << o; self; end
---------------------------
class Object
  def eigenclass
    class << self; self; end
  end
end
---------------------------
message = "hello"
message.world
---------------------------
NoMethodError: undefined method `world' for "hello":String
---------------------------
class C
end
---------------------------
c = C.new
---------------------------
def Integer.parse(text)
  text.to_i
end
---------------------------
n = Fixnum.parse("1")
---------------------------
module Kernel
  # Constants defined in Kernel
  A = B = C = D = E = F = "defined in kernel"
end

# Top-level or "global" constants defined in Object
A = B = C = D = E = "defined at toplevel"

class Super
  # Constants defined in a superclass
  A = B = C = D = "defined in superclass"
end

module Included
  # Constants defined in an included module
  A = B = C = "defined in included module"
end

module Enclosing
  # Constants defined in an enclosing module
  A = B = "defined in enclosing module"

  class Local < Super
    include Included

    # Locally defined constant
    A = "defined locally"

    # The list of modules searched, in the order searched
    # [Enclosing::Local, Enclosing, Included, Super, Object, Kernel]
    search = (Module.nesting + self.ancestors + Object.ancestors).uniq

    puts A  # Prints "defined locally"
    puts B  # Prints "defined in enclosing module"
    puts C  # Prints "defined in included module"
    puts D  # Prints "defined in superclass"
    puts E  # Prints "defined at toplevel"
    puts F  # Prints "defined in kernel"
  end
end
---------------------------
