#!/usr/bin/env ruby
puts %q^


^
puts %q^
*****************
def factorial(n)
  if n < 1                # Test the argument value for validity
    raise "argument must be > 0"
  elsif n == 1            # If the argument is 1
    1                     # then the value of the method invocation is 1
  else                    # Otherwise, the factorial of n is n times
    n * factorial(n-1)    # the factorial of n-1
  end
end
#---------------------------
def factorial(n)
  raise "bad argument" if n < 1
  return 1 if n == 1
  n * factorial(n-1)
end
******************
^
puts ; gets
puts %q^
*****************
#---------------------------
# Convert the Cartesian point (x,y) to polar (magnitude, angle) coordinates
def polar(x,y)
  return Math.hypot(y,x), Math.atan2(y,x)
end
#---------------------------
# Convert polar coordinates to Cartesian coordinates
def cartesian(magnitude, angle)
  [magnitude*Math.cos(angle), magnitude*Math.sin(angle)]
end

distance, theta = polar(x,y)
x,y = cartesian(distance,theta)
******************
^
puts ; gets
puts %q^
*****************
o = "message"    # A string is an object
def o.printme    # Define a singleton method for this object
  puts self
end
o.printme        # Invoke the singleton 

def sum(x,y); x+y; end      # Define a method
puts sum(1,2)               # Use it
undef sum                   # And undefine it
******************
^

puts %q^
*****************
#---------------------------
alias aka also_known_as   # alias new_name existing_name
#---------------------------
def hello                       # A nice simple method
  puts "Hello World"            # Suppose we want to augment it...
end

alias original_hello hello      # Give the method a backup name

def hello                       # Now we define a new method with the old name
  puts "Your attention please"  # That does some stuff
  original_hello                # Then calls the original method
  puts "This has been a test"   # Then does some more stuff
end
#---------------------------

******************
^
puts ; gets
puts %q^
*****************
puts "Hello World"
puts("Hello World")
---------------------------
greeting = "Hello"
size = greeting.length
---------------------------
size = greeting.length()
---------------------------
x = 3              # x is a number
x.between? 1,5     # same as x.between?(1,5)
---------------------------
def sum x, y
  x+y
end
---------------------------
puts sum 2, 2
---------------------------
puts sum(2,2)
---------------------------
puts(sum 2,2)   # Does this mean puts(sum(2,2)) or puts(sum(2), 2)?
---------------------------
puts factorial x   # This can only mean puts(factorial(x))
---------------------------
puts 4, sum 2,2   # Error: does the second comma go with the 1st or 2nd method?
[sum 2,2]         # Error: two array elements or one?
---------------------------
square(2+2)*2    # square(4)*2 = 16*2 = 32
square (2+2)*2   # square(4*2) = square(8) = 64
---------------------------
square((2+2)*2)
---------------------------
puts(sum 2,2)   # Does this mean puts(sum(2,2)) or puts(sum(2), 2)?
---------------------------
puts (sum 2,2)   
---------------------------

******************
^
puts ; gets
puts %q^
*****************
def prefix(s, len=1)
  s[0,len]
end

prefix("Ruby", 3)    # => "Rub"
prefix("Ruby")       # => "R"

# Return the last character of s or the substring from index to the end
def suffix(s, index=s.size-1)
  s[index, s.size-index]
end

# Append the value x to the array a, return a.
# If no array is specified, start with an empty one.
def append(x, a=[])
  a << x
end

******************
^
puts ; gets
puts %q^
*****************
# Return the largest of the one or more arguments passed
def max(first, *rest)
  # Assume that the required first argument is the largest
  max = first
  # Now loop through each of the optional arguments looking for bigger ones
  rest.each {|x| max = x if x > max }
  # Return the largest one we found
  max
end
---------------------------
max(1)       # first=1, rest=[]   
max(1,2)     # first=1, rest=[2]  
max(1,2,3)   # first=1, rest=[2,3]
---------------------------
data = [3, 2, 1]
m = max(*data)   # first = 3, rest=[2,1] => 3
---------------------------
m = max(data)   # first = [3,2,1], rest=[] => [3,2,1]
---------------------------
# Convert the point (x,y) to Polar coordinates, then back to Cartesian
x,y = cartesian(*polar(x, y))
---------------------------
max(*"hello world".each_char)  # => 'w'

******************
^
puts ; gets
puts %q^
*****************
# This method returns an array a of n numbers. For any index i, 0 <= i < n,
# the value of element a[i] is m*i+c. Arguments n, m, and c are passed
# as keys in a hash, so that it is not necessary to remember their order.
def sequence(args)
  # Extract the arguments from the hash.
  # Note the use of the || operator to specify defaults used
  # if the hash does not define a key that we are interested in.
  n = args[:n] || 0
  m = args[:m] || 1
  c = args[:c] || 0

  a = []                      # Start with an empty array
  n.times {|i| a << m*i+c }   # Calculate the value of each array element
  a                           # Return the array
end
---------------------------
sequence({:n=>3, :m=>5})      # => [0, 5, 10]
---------------------------
sequence(:m=>3, :n=>5)        # => [0, 3, 6, 9, 12]
---------------------------
# Ruby 1.9 hash syntax
sequence c:1, m:3, n:5        # => [1, 4, 7, 10, 13]
---------------------------
sequence {:m=>3, :n=>5}       # Syntax error!

******************
^
puts ; gets
puts %q^
*****************
# Generate a sequence of n numbers m*i + c and pass them to the block
def sequence2(n, m, c) 
  i = 0
  while(i < n)         # loop n times
    yield i*m + c      # pass next element of the sequence to the block
    i += 1
  end
end

# Here is how you might use this version of the method
sequence2(5, 2, 2) {|x| puts x }  # Print numbers 2, 4, 6, 8, 10
---------------------------
def sequence3(n, m, c, &b) # Explicit argument to get block as a Proc
  i = 0
  while(i < n)
    b.call(i*m + c)        # Invoke the Proc with its call method
    i += 1
  end
end

# Note that the block is still passed outside of the parentheses
sequence3(5, 2, 2) {|x| puts x }

******************
^
puts ; gets
puts %q^
*****************
# This version expects an explicitly-created Proc object, not a block
def sequence4(n, m, c, b)  # No ampersand used for argument b
  i = 0
  while(i < n)
    b.call(i*m + c)        # Proc is called explicitly
    i += 1
  end
end

p = Proc.new {|x| puts x }  # Explicitly create a Proc object 
sequence4(5, 2, 2, p)       # And pass it as an ordinary argument
---------------------------
def sequence5(args, &b) # Pass arguments as a hash and follow with a block
  n, m, c = args[:n], args[:m], args[:c]
  i = 0
  while(i < n)
    b.call(i*m + c)
    i += 1
  end
end

# Expects one or more arguments, followed by a block
def max(first, *rest, &block) 
  max = first
  rest.each {|x| max = x if x > max }
  block.call(max)
  max
end
---------------------------

******************
^
puts ; gets
puts %q^
*****************
---------------------------
a, b = [1,2,3], [4,5]                     # Start with some data.
sum = a.inject(0) {|total,x| total+x }    # => 6. Sum elements of a.
sum = b.inject(sum) {|total,x| total+x }  # => 15. Add the elements of b in.
---------------------------
a, b = [1,2,3], [4,5]                     # Start with some data.
summation = Proc.new {|total,x| total+x } # A Proc object for summations.
sum = a.inject(0, &summation)             # => 6
sum = b.inject(sum, &summation)           # => 15
---------------------------
words = ['and', 'but', 'car']     # An array of words
uppercase = words.map &:upcase    # Convert to uppercase with String.upcase
upper = words.map {|w| w.upcase } # This is the equivalent code with a block

******************
^
puts ; gets
__END__
# Define a method named 'factorial' with a single parameter 'n'
def factorial(n)
  if n < 1                # Test the argument value for validity
    raise "argument must be > 0"
  elsif n == 1            # If the argument is 1
    1                     # then the value of the method invocation is 1
  else                    # Otherwise, the factorial of n is n times
    n * factorial(n-1)    # the factorial of n-1
  end
end
---------------------------
def factorial(n)
  raise "bad argument" if n < 1
  return 1 if n == 1
  n * factorial(n-1)
end
---------------------------
# Convert the Cartesian point (x,y) to polar (magnitude, angle) coordinates
def polar(x,y)
  return Math.hypot(y,x), Math.atan2(y,x)
end
---------------------------
# Convert polar coordinates to Cartesian coordinates
def cartesian(magnitude, angle)
  [magnitude*Math.cos(angle), magnitude*Math.sin(angle)]
end
---------------------------
distance, theta = polar(x,y)
x,y = cartesian(distance,theta)
---------------------------
first = text.index(pattern)
---------------------------
o = "message"    # A string is an object
def o.printme    # Define a singleton method for this object
  puts self
end
o.printme        # Invoke the singleton 
---------------------------
def sum(x,y); x+y; end      # Define a method
puts sum(1,2)               # Use it
undef sum                   # And undefine it
---------------------------
def +(other)               # Define binary plus operator: x+y is x.+(y)
  self.concatenate(other)
end       
---------------------------
alias aka also_known_as   # alias new_name existing_name
---------------------------
def hello                       # A nice simple method
  puts "Hello World"            # Suppose we want to augment it...
end

alias original_hello hello      # Give the method a backup name

def hello                       # Now we define a new method with the old name
  puts "Your attention please"  # That does some stuff
  original_hello                # Then calls the original method
  puts "This has been a test"   # Then does some more stuff
end
---------------------------
puts "Hello World"
puts("Hello World")
---------------------------
greeting = "Hello"
size = greeting.length
---------------------------
size = greeting.length()
---------------------------
x = 3              # x is a number
x.between? 1,5     # same as x.between?(1,5)
---------------------------
def sum x, y
  x+y
end
---------------------------
puts sum 2, 2
---------------------------
puts sum(2,2)
---------------------------
puts(sum 2,2)   # Does this mean puts(sum(2,2)) or puts(sum(2), 2)?
---------------------------
puts factorial x   # This can only mean puts(factorial(x))
---------------------------
puts 4, sum 2,2   # Error: does the second comma go with the 1st or 2nd method?
[sum 2,2]         # Error: two array elements or one?
---------------------------
square(2+2)*2    # square(4)*2 = 16*2 = 32
square (2+2)*2   # square(4*2) = square(8) = 64
---------------------------
square((2+2)*2)
---------------------------
puts(sum 2,2)   # Does this mean puts(sum(2,2)) or puts(sum(2), 2)?
---------------------------
puts (sum 2,2)   
---------------------------
def prefix(s, len=1)
  s[0,len]
end
---------------------------
prefix("Ruby", 3)    # => "Rub"
prefix("Ruby")       # => "R"
---------------------------
# Return the last character of s or the substring from index to the end
def suffix(s, index=s.size-1)
  s[index, s.size-index]
end
---------------------------
# Append the value x to the array a, return a.
# If no array is specified, start with an empty one.
def append(x, a=[])
  a << x
end
---------------------------
# Return the largest of the one or more arguments passed
def max(first, *rest)
  # Assume that the required first argument is the largest
  max = first
  # Now loop through each of the optional arguments looking for bigger ones
  rest.each {|x| max = x if x > max }
  # Return the largest one we found
  max
end
---------------------------
max(1)       # first=1, rest=[]   
max(1,2)     # first=1, rest=[2]  
max(1,2,3)   # first=1, rest=[2,3]
---------------------------
data = [3, 2, 1]
m = max(*data)   # first = 3, rest=[2,1] => 3
---------------------------
m = max(data)   # first = [3,2,1], rest=[] => [3,2,1]
---------------------------
# Convert the point (x,y) to Polar coordinates, then back to Cartesian
x,y = cartesian(*polar(x, y))
---------------------------
max(*"hello world".each_char)  # => 'w'
---------------------------
# This method returns an array a of n numbers. For any index i, 0 <= i < n,
# the value of element a[i] is m*i+c. Arguments n, m, and c are passed
# as keys in a hash, so that it is not necessary to remember their order.
def sequence(args)
  # Extract the arguments from the hash.
  # Note the use of the || operator to specify defaults used
  # if the hash does not define a key that we are interested in.
  n = args[:n] || 0
  m = args[:m] || 1
  c = args[:c] || 0

  a = []                      # Start with an empty array
  n.times {|i| a << m*i+c }   # Calculate the value of each array element
  a                           # Return the array
end
---------------------------
sequence({:n=>3, :m=>5})      # => [0, 5, 10]
---------------------------
sequence(:m=>3, :n=>5)        # => [0, 3, 6, 9, 12]
---------------------------
# Ruby 1.9 hash syntax
sequence c:1, m:3, n:5        # => [1, 4, 7, 10, 13]
---------------------------
sequence {:m=>3, :n=>5}       # Syntax error!
---------------------------
# Generate a sequence of n numbers m*i + c and pass them to the block
def sequence2(n, m, c) 
  i = 0
  while(i < n)         # loop n times
    yield i*m + c      # pass next element of the sequence to the block
    i += 1
  end
end

# Here is how you might use this version of the method
sequence2(5, 2, 2) {|x| puts x }  # Print numbers 2, 4, 6, 8, 10
---------------------------
def sequence3(n, m, c, &b) # Explicit argument to get block as a Proc
  i = 0
  while(i < n)
    b.call(i*m + c)        # Invoke the Proc with its call method
    i += 1
  end
end

# Note that the block is still passed outside of the parentheses
sequence3(5, 2, 2) {|x| puts x }
---------------------------
# This version expects an explicitly-created Proc object, not a block
def sequence4(n, m, c, b)  # No ampersand used for argument b
  i = 0
  while(i < n)
    b.call(i*m + c)        # Proc is called explicitly
    i += 1
  end
end

p = Proc.new {|x| puts x }  # Explicitly create a Proc object 
sequence4(5, 2, 2, p)       # And pass it as an ordinary argument
---------------------------
def sequence5(args, &b) # Pass arguments as a hash and follow with a block
  n, m, c = args[:n], args[:m], args[:c]
  i = 0
  while(i < n)
    b.call(i*m + c)
    i += 1
  end
end

# Expects one or more arguments, followed by a block
def max(first, *rest, &block) 
  max = first
  rest.each {|x| max = x if x > max }
  block.call(max)
  max
end
---------------------------
a, b = [1,2,3], [4,5]                     # Start with some data.
sum = a.inject(0) {|total,x| total+x }    # => 6. Sum elements of a.
sum = b.inject(sum) {|total,x| total+x }  # => 15. Add the elements of b in.
---------------------------
a, b = [1,2,3], [4,5]                     # Start with some data.
summation = Proc.new {|total,x| total+x } # A Proc object for summations.
sum = a.inject(0, &summation)             # => 6
sum = b.inject(sum, &summation)           # => 15
---------------------------
words = ['and', 'but', 'car']     # An array of words
uppercase = words.map &:upcase    # Convert to uppercase with String.upcase
upper = words.map {|w| w.upcase } # This is the equivalent code with a block
---------------------------
# This method creates a proc from a block
def makeproc(&p)  # Convert associated block to a Proc and store in p
  p               # Return the Proc object
end
---------------------------
adder = makeproc {|x,y| x+y }
---------------------------
sum = adder.call(2,2)  # => 4
---------------------------
p = Proc.new {|x,y| x+y }
---------------------------
def invoke(&b)     def invoke
  b.call             Proc.new.call
end                end
---------------------------
is_positive = lambda {|x| x > 0 }
---------------------------
succ = lambda {|x| x+1}
---------------------------
succ = ->(x){ x+1 }
---------------------------
succ.call(2)    # => 3
---------------------------
# This lambda takes 2 args and declares 3 local vars
f = ->(x,y; i,j,k) { ... }
---------------------------
zoom = ->(x,y,factor=2) { [x*factor, y*factor] }
---------------------------
succ = ->x { x+1 }
f = -> x,y; i,j,k { ... }
zoom = ->x,y,factor=2 { [x*factor, y*factor] }
---------------------------
->{}
---------------------------
def compose(f,g)            # Compose 2 lambdas 
  ->(x) { f.call(g.call(x)) }
end
succOfSquare = compose(->x{x+1}, ->x{x*x})
succOfSquare.call(4)        # => 17: Computes (4*4)+1
---------------------------
data.sort {|a,b| b-a }   # The block version
data.sort &->(a,b){ b-a } # The lambda literal version
---------------------------
f = Proc.new {|x,y| 1.0/(1.0/x + 1.0/y) }
z = f.call(x,y)
---------------------------
z = f[x,y]
---------------------------
z = f.(x,y)
---------------------------
lambda{||}.arity        # => 0. No arguments expected
lambda{|x| x}.arity     # => 1. One argument expected
lambda{|x,y| x+y}.arity # => 2. Two arguments expected
---------------------------
lambda {|*args|}.arity        # => -1.  ~-1 = -(-1)-1 = 0 arguments required
lambda {|first, *rest|}.arity # => -2.  ~-2 = -(-2)-1 = 1 argument required
---------------------------
puts lambda {}.arity  # &#x2013;1 in Ruby 1.8; 0 in Ruby 1.9
---------------------------
lambda {|x| x*x } == lambda {|x| x*x }  # => false
---------------------------
p = lambda {|x| x*x }
q = p.dup
p == q                      # => true: the two procs are equal
p.object_id == q.object_id  # => false: they are not the same object
---------------------------
def test
  puts "entering method"
  1.times { puts "entering block"; return }  # Makes test method return
  puts "exiting method"  # This line is never executed
end
test
---------------------------
def test
  puts "entering method"
  p = Proc.new { puts "entering proc"; return } 
  p.call                 # Invoking the proc makes method return
  puts "exiting method"  # This line is never executed
end
test
---------------------------
def procBuilder(message)            # Create and return a proc
  Proc.new { puts message; return } # return returns from procBuilder
  # but procBuilder has already returned here!
end

def test
  puts "entering method"
  p = procBuilder("entering proc")
  p.call                 # Prints "entering proc" and raises LocalJumpError!
  puts "exiting method"  # This line is never executed
end
test
---------------------------
def test
  puts "entering method"
  p = lambda { puts "entering lambda"; return } 
  p.call                 # Invoking the lambda does not make the method return
  puts "exiting method"  # This line *is* executed now
end
test
---------------------------
def lambdaBuilder(message)        # Create and return a lambda
  lambda { puts message; return } # return returns from the lambda
end

def test
  puts "entering method"
  l = lambdaBuilder("entering lambda")
  l.call                 # Prints "entering lambda" 
  puts "exiting method"  # This line is executed
end
test
---------------------------
def test
  puts "entering test method"
  proc = Proc.new { puts "entering proc"; break }
  proc.call                    # LocalJumpError: iterator has already returned
  puts "exiting test method"
end
test
---------------------------
def iterator(&proc)
  puts "entering iterator"
  proc.call  # invoke the proc
  puts "exiting iterator"   # Never executed if the proc breaks
end

def test
  iterator { puts "entering proc"; break }
end
test
---------------------------
def test
  puts "entering test method"
  lambda = lambda { puts "entering lambda"; break; puts "exiting lambda" }
  lambda.call  
  puts "exiting test method"
end
test
---------------------------
p = Proc.new {|x,y| print x,y }
p.call(1)       # x,y=1:     nil used for missing rvalue:  Prints 1nil
p.call(1,2)     # x,y=1,2:   2 lvalues, 2 rvalues:         Prints 12
p.call(1,2,3)   # x,y=1,2,3: extra rvalue discarded:       Prints 12
p.call([1,2])   # x,y=[1,2]: array automatically unpacked: Prints 12
---------------------------
l = lambda {|x,y| print x,y }
l.call(1,2)     # This works
l.call(1)       # Wrong number of arguments
l.call(1,2,3)   # Wrong number of arguments
l.call([1,2])   # Wrong number of arguments
l.call(*[1,2])  # Works: explicit splat to unpack the array
---------------------------
# multiply each element of the data array by n
def multiply(data, n)
  data.collect {|x| x*n }
end

puts multiply([1,2,3], 2)   # Prints 2,4,6
---------------------------
# Return a lambda that retains or "closes over" the argument n
def multiplier(n) 
  lambda {|data| data.collect{|x| x*n } }
end
doubler = multiplier(2)     # Get a lambda that knows how to double
puts doubler.call([1,2,3])  # Prints 2,4,6
---------------------------
# Return a pair of lambdas that share access to a local variable.
def accessor_pair(initialValue=nil)
  value = initialValue  # A local variable shared by the returned lambdas.
  getter = lambda { value }          # Return value of local variable.
  setter = lambda {|x| value = x }   # Change value of local variable.
  return getter,setter               # Return pair of lambdas to caller.
end

getX, setX = accessor_pair(0) # Create accessor lambdas for initial value 0.
puts getX[]        # Prints 0. Note square brackets instead of call.
setX[10]           # Change the value through one closure.
puts getX[]        # Prints 10. The change is visible through the other.
---------------------------
# Return an array of lambdas that multiply by the arguments
def multipliers(*args)
  x = nil
  args.map {|x| lambda {|y| x*y }}
end

double,triple = multipliers(2,3)
puts double.call(2)    # Prints 6 in Ruby 1.8
---------------------------
# Return a lambda that retains or "closes over" the argument n
def multiplier(n) 
  lambda {|data| data.collect{|x| x*n } }
end
doubler = multiplier(2)     # Get a lambda that knows how to double
puts doubler.call([1,2,3])  # Prints 2,4,6
---------------------------
eval("n=3", doubler.binding) # Or doubler.binding.eval("n=3") in Ruby 1.9
puts doubler.call([1,2,3])   # Now this prints 3,6,9!
---------------------------
eval("n=3", doubler)
---------------------------
m = 0.method(:succ)  # A Method representing the succ method of Fixnum 0
---------------------------
puts m.call    # Same as puts 0.succ. Or use puts m[].
---------------------------
def square(x); x*x; end
puts (1..10).map(&method(:square))
---------------------------
unbound_plus = Fixnum.instance_method("+")
---------------------------
plus_2 = unbound_plus.bind(2)   # Bind the method to the object 2
---------------------------
sum = plus_2.call(2)    # => 4
---------------------------
plus_3 = plus_2.unbind.bind(3)
---------------------------
# Compute the average and standard deviation of an array of numbers
mean = a.inject {|x,y| x+y } / a.size
sumOfSquares = a.map{|x| (x-mean)**2 }.inject{|x,y| x+y }
standardDeviation = Math.sqrt(sumOfSquares/(a.size-1))
---------------------------
# This module defines methods and operators for functional programming.
module Functional

  # Apply this function to each element of the specified Enumerable,
  # returning an array of results. This is the reverse of Enumerable.map.
  # Use | as an operator alias. Read "|" as "over" or "applied over".
  # 
  # Example:
  #   a = [[1,2],[3,4]]
  #   sum = lambda {|x,y| x+y}
  #   sums = sum|a   # => [3,7]
  def apply(enum)
    enum.map &self
  end
  alias | apply

  # Use this function to "reduce" an enumerable to a single quantity.
  # This is the inverse of Enumerable.inject.
  # Use <= as an operator alias.
  # Mnemonic: <= looks like a needle for injections
  # Example:
  #   data = [1,2,3,4]
  #   sum = lambda {|x,y| x+y}
  #   total = sum<=data   # => 10
  def reduce(enum)
    enum.inject &self
  end
  alias <= reduce
end

# Add these functional programming methods to Proc and Method classes.
class Proc; include Functional; end
class Method; include Functional; end
---------------------------
sum = lambda {|x,y| x+y }        # A function to add two numbers
mean = (sum<=a)/a.size           # Or sum.reduce(a) or a.inject(&sum)
deviation = lambda {|x| x-mean } # Function to compute difference from mean
square = lambda {|x| x*x }       # Function to square a number
standardDeviation = Math.sqrt((sum<=square|(deviation|a))/(a.size-1))
---------------------------
module Functional
  # Return a new lambda that computes self[f[args]].
  # Use * as an operator alias for compose.
  # Examples, using the * alias for this method.
  # 
  # f = lambda {|x| x*x }
  # g = lambda {|x| x+1 }
  # (f*g)[2]   # => 9
  # (g*f)[2]   # => 5
  # 
  # def polar(x,y)
  #   [Math.hypot(y,x), Math.atan2(y,x)]
  # end
  # def cartesian(magnitude, angle)
  #   [magnitude*Math.cos(angle), magnitude*Math.sin(angle)]
  # end
  # p,c = method :polar, method :cartesian
  # (c*p)[3,4]  # => [3,4]
  # 
  def compose(f)
    if self.respond_to?(:arity) && self.arity == 1
      lambda {|*args| self[f[*args]] }
    else
      lambda {|*args| self[*f[*args]] }
    end
  end

  # * is the natural operator for function composition.
  alias * compose
end
---------------------------
standardDeviation = Math.sqrt((sum<=square*deviation|a)/(a.size-1))
---------------------------
product = lambda {|x, y| x*y }       # A function of two arguments
double = lambda {|x| product(2,x) }  # Apply one argument
---------------------------
module Functional
  #
  # Return a lambda equivalent to this one with one or more initial 
  # arguments applied. When only a single argument
  # is being specified, the >> alias may be simpler to use.
  # Example:
  #   product = lambda {|x,y| x*y}
  #   doubler = lambda >> 2
  #
  def apply_head(*first)
    lambda {|*rest| self[*first.concat(rest)]}
  end

  #
  # Return a lambda equivalent to this one with one or more final arguments
  # applied. When only a single argument is being specified,
  # the << alias may be simpler.
  # Example:
  #  difference = lambda {|x,y| x-y }
  #  decrement = difference << 1
  #
  def apply_tail(*last)
    lambda {|*rest| self[*rest.concat(last)]}
  end

  # Here are operator alternatives for these methods. The angle brackets
  # point to the side on which the argument is shifted in.
  alias >> apply_head    # g = f >> 2 -- set first arg to 2
  alias << apply_tail    # g = f << 2 -- set last arg to 2
end
---------------------------
difference = lambda {|x,y| x-y }  # Compute difference of two numbers
deviation = difference<<mean      # Apply second argument
---------------------------
module Functional
  #
  # Return a new lambda that caches the results of this function and 
  # only calls the function when new arguments are supplied.
  #
  def memoize
    cache = {}  # An empty cache. The lambda captures this in its closure.
    lambda {|*args|
      # notice that the hash key is the entire array of arguments!
      unless cache.has_key?(args)  # If no cached result for these args
        cache[args] = self[*args]  # Compute and cache the result
      end
      cache[args]                  # Return result from cache
    }
  end
  # A (probably unnecessary) unary + operator for memoization
  # Mnemonic: the + operator means "improved"
  alias +@ memoize        # cached_f = +f
end
---------------------------
# A memoized recursive factorial function
factorial = lambda {|x| return 1 if x==0; x*factorial[x-1]; }.memoize
# Or, using the unary operator syntax
factorial = +lambda {|x| return 1 if x==0; x*factorial[x-1]; }
---------------------------
factorial = lambda {|x| return 1 if x==0; x*factorial[x-1]; }
cached_factorial = +factorial # Recursive calls aren't cached!
---------------------------
# Increment an array of integers with the Fixnum.succ method
[1,2,3].map(&:succ)  # => [2,3,4]
---------------------------
[1,2,3].map {|n| n.succ }
---------------------------
class Symbol
  def to_proc
    lambda {|receiver, *args| receiver.send(self, *args)}
  end
end
---------------------------
class Symbol
  def to_proc
    lambda {|receiver, *args| receiver.method(self)[*args]}
  end
end
---------------------------
class Module
  # Access instance methods with array notation. Returns UnboundMethod,
  alias [] instance_method
end
---------------------------
String[:reverse].bind("hello").call   # => "olleh"
---------------------------
class UnboundMethod
  # Allow [] as an alternative to bind.  
  alias [] bind
end
---------------------------
String[:reverse]["hello"][]   # => "olleh"
---------------------------
class Module
  # Define a instance method with name sym and body f.
  # Example: String[:backwards] = lambda { reverse }
  def []=(sym, f)
    self.instance_eval { define_method(sym, f) }
  end
end
---------------------------
Enumerable[:average] = lambda do
  sum, n = 0.0, 0
  self.each {|x| sum += x; n += 1 }
  if n == 0
    nil
  else
    sum/n
  end
end
---------------------------
#
# Add [] and []= operators to the Symbol class for accessing and setting
# singleton methods of objects. Read : as "method" and [] as "of".
# So :m[o] reads "method m of o".
#
class Symbol
  # Return the Method of obj named by this symbol. This may be a singleton
  # method of obj (such as a class method) or an instance method defined
  # by obj.class or inherited from a superclass.
  # Examples:
  #   creator = :new[Object]  # Class method Object.new
  #   doubler = :*[2]         # * method of Fixnum 2
  #
  def [](obj)
    obj.method(self)
  end
  
  # Define a singleton method on object o, using Proc or Method f as its body.
  # This symbol is used as the name of the method.
  # Examples:
  #
  #  :singleton[o] = lambda { puts "this is a singleton method of o" }
  #  :class_method[String] = lambda { puts "this is a class method" }
  # 
  # Note that you can't create instance methods this way. See Module.[]=
  #
  def []=(o,f)
    # We can't use self in the block below, as it is evaluated in the 
    # context of a different object. So we have to assign self to a variable.
    sym = self
    # This is the object we define singleton methods on.
    eigenclass = (class << o; self end)
    # define_method is private, so we have to use instance_eval to execute it.
    eigenclass.instance_eval { define_method(sym, f) }
  end
end
---------------------------
dashes = :*['-']       # Method * of '-'
puts dashes[10]        # Prints "----------"

y = (:+[1]*:*[2])[x]   # Another way to write y = 2*x + 1
---------------------------
