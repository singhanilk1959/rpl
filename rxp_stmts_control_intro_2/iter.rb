#!/usr/bin/env ruby
# If x is less than 10, increment it
#puts ; out = gets ;
print %^
# It is more common to write loops using iterators rather than while,until, for.
# The complex control behind this is yield.
# The term iterator is used to mean any method that uses yield.
# A method that expects a block and invokes it multiple times is called an iterator.

#************************
data = [8 10 15]
data.each {|x| print x }        # Print each element x of data
3.times { puts "thank you!" }  # Express gratitude three times
[1,2,3].map {|x| x*x }         # Compute squares of array elements
factorial = 1                  # Compute the factorial of n
n = 4
2.upto(n) {|x| factorial *= x }
#************************


^
# It is more common to write loops using iterators rather than while,until, for.
# The complex control behind this is yield.
# The term iterator is used to mean any method that uses yield.
data = [8 ,10 , 15]
data.each {|x| print x } ; puts        # Print each element x of data
3.times { puts "thank you!" }  # Express gratitude three times
print [1,2,3].map {|x| x*x } ; puts         # Compute squares of array elements
factorial = 1                  # Compute the factorial of n
n = 4
print 2.upto(4) {|x| factorial *= x } ; puts
puts factorial

puts ; out = gets ;

print %q^
#************************
hello world returns an Enumerator when called with each_char without any 
blocks. to_a calls the #each of this returned Enumerator which in turn calls each_char of String.


# The tap method, an iterator defined in Object class, takes the receiver and returns the receiver. 
chars = "hello world".tap {|x| puts "original object: #{x.inspect}"}
  .each_char         .tap {|x| puts "each_char returns: #{x.inspect}"}
  .to_a              .tap {|x| puts "to_a returns: #{x.inspect}"}
  .map {|c| c.succ } .tap {|x| puts "map returns: #{x.inspect}" }
  .sort              .tap {|x| puts "sort returns: #{x.inspect}"}

#************************
^
chars = "hello world".tap {|x| puts "original object: #{x.inspect}"}
  .each_char         .tap {|x| puts "each_char returns: #{x.inspect}"}
  .to_a              .tap {|x| puts "to_a returns: #{x.inspect}"}
  .map {|c| c.succ } .tap {|x| puts "map returns: #{x.inspect}" }
  .sort              .tap {|x| puts "sort returns: #{x.inspect}"}

gets
print %q^
****** READ ONLINE DOCUMENTATION for Enumerable::Enumerator ************

Enumerators are of class Enumerable::Enumerator. A class which allows both internal and external iteration.

An Enumerator can be created by : Kernel#enum_for, Kernel#to_enum, ::new.

Internal iterator: When the iterator controls the iteration, the iterator is an Internal iterator.
External iterator: When the client controls the iteration.


Although new can be used to instantiate this class, use to_enum or its synonym
enum_for defined in Objects to create Enumerators.

With no arguments, to_enum returns an Enumerator whose #each method will simply call the #each method  of the target object.

You can pass arguments to to_num, although enum_for seems more natural in this case. The first argument should be a symbol that identifies an iterator method. 
The each method of the resulting Enumerator will invoke the named method of the original object. Any remaining arguments will be passed to the named method.

In ruby 1.9, it is not even necessary to use to_enum/enun_for. Because, the built-in Numeric iterators (times,upto,downto,step) and Enumerable methods each and related methods return an Enumerator when invoked with no-block.

Your class may define iterators each or others  but may not be Enumerable as it has not included Enumerable include Enumerable i.e you can not use collect, reject etc.

In Ruby 1.9, the String class is not Enumerable.
But, it defines three iterators each_char, each_byte, each_line

******************************************
^
puts ; out = gets ;
print %q^

#************************
4.upto(6) {|x| print x}   # => prints "456"
6.downto(4) {|x| print x}# => prints "654"

3.times {|x| print x }    # => prints "012"
#is equivalent to
0.upto(2){|x| print x }
#---------------------------
0.step(Math::PI, 0.1) {|x| puts Math.sin(x) }

#************************
^
4.upto(6) {|x| print x} ; puts   # => prints "456"
6.downto(4) {|x| print x} ; puts# => prints "654"

3.times {|x| print x }    ; puts # => prints "012"
#is equivalent to
0.upto(2){|x| print x } ; puts
0.step(Math::PI, 0.5) {|x| puts Math.sin(x) }
#---------------------------


puts ; out = gets ;
print %q^

#************ENUMERABLE OBJECTS ************
 Array, Hash, Range and a number of other classes define an #each iterator which passes each element of the collection to the block

 For loop works only for iterating over objects that have #each method.

 Most classes  that define an #each method also include the Enumerable module,
 which define a number of sophiscated iterators on the top of #each method.


^
puts ; out = gets ;
puts ; out = gets ;
print %q^

#*********************************************
 The Enumerable mixin provides collection classes with several traversal and
 searching methods, and with the ability to sort. The class must provide a
 method #each, which yields successive members of the collection. If
 Enumerable#max, #min, or #sort is used, the objects in the collection must
 also implement a meaningful <=> operator, as these methods rely on an ordering
 between members of the collection.

= Instance methods:

  all?, any?, chunk, collect, collect_concat, count, cycle, detect, drop,
  drop_while, each_cons, each_entry, each_slice, each_with_index,
  each_with_object, entries, find, find_all, find_index, first, flat_map,
  grep, group_by, include?, inject, map, max, max_by, member?, min, min_by,
  minmax, minmax_by, none?, one?, partition, reduce, reject, reverse_each,
  select, slice_before, sort, sort_by, take, take_while, to_a, to_json,
  to_set, zip
#*********************************************
^

puts '[1,2,3].each {|x| print x }   # => prints "123" '
[1,2,3].each {|x| print x };puts   # => prints "123"
puts '(1..3).each  {|x| print x }   # => prints "123" Same as 1.upto(3) '
(1..3).each  {|x| print x } ; puts   # => prints "123" Same as 1.upto(3)
puts
#---------------------------
puts 'squares = [1,2,3].collect {|x| x*x}   # => [1,4,9] '
squares = [1,2,3].collect {|x| x*x}   # => [1,4,9]
print squares ; puts
#---------------------------
puts 'evens = (1..10).select {|x| x%2 == 0} # => [2,4,6,8,10]'
evens = (1..10).select {|x| x%2 == 0} # => [2,4,6,8,10]
print evens ; puts

puts 'odds = (1..10).reject {|x| x%2 == 0}  # => [1,3,5,7,9]'
odds = (1..10).reject {|x| x%2 == 0}  # => [1,3,5,7,9]
print odds ; puts
puts ; out = gets ;

puts ; out = gets ;
print %q^
**************************************
 The inject method takes two arguments. The first arguments is an acculumalated value of some sort from previous iterations and also is the value returned after last iteration.
 
**************************************
^
#**************************************
# The inject method takes two arguments. The first arguments is an acculumalated value of some sort from previous iterations and also is the value returned after last iteration.

print data = [2, 5, 3, 4] ; puts
puts 'sum = data.inject {|sum, x| sum + x }       # => 14    (2+5+3+4) '
sum = data.inject {|sum, x| sum + x } ; puts sum      # => 14    (2+5+3+4)
puts 'sum = data.inject(10) {|sum, x| sum + x }       # => 24    (10+2+5+3+4)'
sum = data.inject(10) {|sum, x| sum + x }   ; puts sum    # => 24    (10+2+5+3+4)
puts 'floatprod = data.inject(1.0) {|p,x| p*x }   # => 120.0 (1.0*2*5*3*4) '
floatprod = data.inject(1.0) {|p,x| p*x }   ; puts floatprod # => 120.0 (1.0*2*5*3*4)
puts 'max = data.inject {|m,x| m>x ? m : x }   ; puts max  # => 5     (largest element) '
max = data.inject {|m,x| m>x ? m : x }   ; puts max  # => 5     (largest element)

puts; gets
#---------------------------
puts %q^
filename = "README"
File.open(filename) do |f|       # Open named file, pass as f
  f.each {|line| print line }    # Print each line in f
end                              # End block and close file
^
puts ; gets
filename = "README"
File.open(filename) do |f|       # Open named file, pass as f
  f.each {|line| print line }    # Print each line in f
end                              # End block and close file
puts
#---------------------------
puts %q^
File.open(filename) do |f|
  f.each_with_index do |line,number|
    print "#{number}: #{line}"
  end
end
^
puts ; gets
File.open(filename) do |f|
  f.each_with_index do |line,number|
    print "#{number}: #{line}"
  end
end
puts
puts ; out = gets ;
print %q^
^
#---------------------------
def twice
  yield
  yield
end
#---------------------------
puts ; out = gets ;
print %q^
******************************

# The defining feature of an iterator is that it invokes a block of code associated with the method incocation.

# This method expects a block. It generates n values of the form
# m*i + c, for i from 0..n-1, and yields them, one at a time, 
# to the associated block.
def sequence(n, m, c)
  i = 0
  while(i < n)      # Loop n times
    yield m*i + c   # Invoke the block, and pass a value to it
    i += 1          # Increment i each time
  end
end

# Here is an invocation of that method, with a block.
# It prints the values 1, 6, and 11
sequence(3, 5, 1) {|y| puts y }

***************************************
^
def sequence(n, m, c)
  i = 0
  while(i < n)      # Loop n times
    yield m*i + c   # Invoke the block, and pass a value to it
    i += 1          # Increment i each time
  end
end
puts 'sequence(3, 5, 1) {|y| puts y } '
sequence(3, 5, 1) {|y| puts y }
puts ; gets

puts ; out = gets ;
print %q^
******************************

# Generate n points evenly spaced around the circumference of a 
# circle of radius r centered at (0,0). Yield the x and y coordinates
# of each point to the associated block.
def circle(r,n)
  n.times do |i|    # Notice that this method is implemented with a block
    angle = Math::PI * 2 * i / n
    yield r*Math.cos(angle), r*Math.sin(angle)
  end
end

# This invocation of the iterator prints:
# (1.00, 0.00) (0.00, 1.00) (-1.00, 0.00) (-0.00, -1.00)
circle(1,4) {|x,y| printf "(%.2f, %.2f) ", x, y }

********************************
^
def circle(r,n)
  n.times do |i|    # Notice that this method is implemented with a block
    angle = Math::PI * 2 * i / n
    yield r*Math.cos(angle), r*Math.sin(angle)
  end
end
puts 'circle(1,4) {|x,y| printf "(%.2f, %.2f) ", x, y }'
circle(1,4) {|x,y| printf "(%.2f, %.2f) ", x, y } ; puts
puts; gets
puts ; gets ;
print %q^
******************************

# Return an array with n elements of the form m*i+c
# If a block is given, also yield each element to the block
def sequence(n, m, c)
  i, s = 0, []                  # Initialize variables
  while(i < n)                  # Loop n times
    y = m*i + c                 # Compute value
    yield y if block_given?     # Yield, if block
    s << y                      # Store the value
    i += 1
  end
  s                             # Return the array of values
end

********************************
^
def sequence(n, m, c)
  i, s = 0, []                  # Initialize variables
  while(i < n)                  # Loop n times
    y = m*i + c                 # Compute value
    yield y if block_given?     # Yield, if block
    s << y                      # Store the value
    i += 1
  end
  s                             # Return the array of values
end

puts 'sequence(5,2,1) { |x| print x } '
sequence(5,2,1) { |x| print x ; print ' ' }
#---------------------------
puts ; out = gets ;

print %q^
#*********Enumerators**********************************

An Enumerator is an Enumerable object whose purpose is to enumerate some other 
object.

An Enumerator is a simple proxy object which takes a call on #each and redirects it to a different method on the under_lying object.

There are several different ways in which an Enumerator can be used:
#	As an external iterator
#	As a proxy for each
#	As a source of values from a block

In 1.8, require 'enumerator' is necessary.
In 1.9, it is built-in.

^
gets

print %q^
#********************************
# Call this method with an Enumerator instead of a mutable array.
# This is a useful defensive strategy to avoid bugs.

#process(data.to_enum)  # Instead of just process(data)
#********************************
^
#process(data.to_enum)  # Instead of just process(data)
#---------------------------
s = "hello" ; puts s
puts 's.enum_for(:each_char).map {|c| c.succ }  # => ["i", "f", "m", "m", "p"]'
print s.enum_for(:each_char).map {|c| c.succ }  # => ["i", "f", "m", "m", "p"]
puts
#---------------------------
#process(data.each_char)  # Instead of just process(data)
#---------------------------
puts '"hello".chars.map {|c| c.succ }  # => ["i", "f", "m", "m", "p"] '
print "hello".chars.map {|c| c.succ }  # => ["i", "f", "m", "m", "p"]
puts
#---------------------------
print %q^
*******************
enumerator = 3.times             # An enumerator object
enumerator.each {|x| print x }   # Prints "012"
******************

^
enumerator = 3.times             # An enumerator object
enumerator.each {|x| print x }   # Prints "012"
puts
print %q^
# downto returns an enumerator with a select method
10.downto(1).select {|x| x%2==0}  # => [10,8,6,4,2]
^

print 10.downto(1).select {|x| x%2==0}  # => [10,8,6,4,2]
puts
print %q^
# each_byte iterator returns an enumerator with a to_a method
"hello".each_byte.to_a            # => [104, 101, 108, 108, 111]
^
print "hello".each_byte.to_a            # => [104, 101, 108, 108, 111]
puts
#---------------------------
def twice
  if block_given?
    yield
    yield
  else
    self.to_enum(:twice)    
  end
end
#---------------------------
s = " hello world"
puts ;puts s
enumerator = s.each_char.with_index
for index,char in enumerator
	print index, ":", char, " "
end
#---------------------------
puts
text = <<END
Hello
World
END
puts ; puts text ;
for line, number in text.each_line.with_index
  print "#{number+1}: #{line}"
end

puts ; out = gets ;

print %q^
********Enumerator as source values from a block********
block =  Enumerator.new {|g| g.yield 1; g.yield 2; g.yield 3}

block.each do |item|
  puts item
end

"g << 1 " is an alternative syntaxx for "g.yield 1".

block =  Enumerator.new {|g| g << 1; g << 2; g <<  3}

block.each do |item|
  puts item
end

It is quite simililar to creating your own object which yield values.

block = Object.new
def block.each
  yield 1; yield 2; yield 3
end

block.each do |item|
  puts item
end
******************************************************
^
block =  Enumerator.new {|g| g.yield 1; g.yield 2; g.yield 3}

block.each do |item|
  puts item
end

puts
block =  Enumerator.new {|g| g << 1; g << 2; g <<  3}

block.each do |item|
  puts item
end

puts
block = Object.new
def block.each
  yield 1; yield 2; yield 3
end
puts
block.each do |item|
  puts item
end

print %q^
**********************External iterator*************
Iterators like #each are Internal Iterators as they control the iterators and "push" valuse to the client i.e the block of code associated with iterator.

Enumerators have an #each method to behave like an internal iterator. In 1.9, Enumerators work like External iteraors - client code can "pull" values from an enumerator with #next as they control the iterators and "push" values to the client i.e the block of code associated with iterator.

Enumerators have an #each method to behave like an internal iterator. In 1.9,
Enumerators also work like External iteraors - client code can "pull" values from an enumerator with #next. 

In 1.9, built-in iterators (which include the numeric iterators #times,#upto,#downto,#step, as well as #each and related methods of Enumerable) automatically returns an Enumerator when invoked with no block

External iterators are the only way to iterate over two collections in pairs i.e
at the same time. Otherwise, one needs to convert a collection to an array so that you can access the its elements while iterating other collection with #each.
******************************************************

^
puts ; out = gets ;

print %q^
**********************External iterator*************
block =  Enumerator.new {|g| g.yield 1; g.yield 2; g.yield 3}

begin
while item = block.next   	# while does not handle StopIteration
  puts "In While", item
end
rescue StopIteration
end

block.rewind
for item in block		#For handles StopIteration
  puts "In For ",item
end

block.rewind

loop do
  item = block.next
  puts "In loop", item
end

*******************************************
^
puts ; out = gets ;
block =  Enumerator.new {|g| g.yield 1; g.yield 2; g.yield 3}

begin
while item = block.next
  puts "In While ",item
end
rescue StopIteration
end
puts
block.rewind
for item in block
  puts "In For ",item
end
puts
block.rewind
loop do
  item = block.next
  puts "In loop", item
end

puts ; out = gets ;
puts %q^
# Iteration and Concurrent Modification
---------------------------
a = [1,2,3,4,5]
#a.each {|x| puts "#{x},#{a.shift}" }  # prints "1,1\n3,2\n5,3"

# To avoid this surprise, use each_in_snapshot to make a defensive copy before iterating it
---------------------------
module Enumerable
  def each_in_snapshot &block
    snapshot = self.dup    # Make a private copy of the Enumerable object
    snapshot.each &block   # And iterate on the copy
  end
end
---------------------------
#a.each_in {|x| puts "#{x},#{a.shift}" }  # prints "1,2,3,4,5"
^

require "./collections.rb"
__END__
x = ARGV[0].to_f  # Convert first argument to a number
y = ARGV[1].to_f  # Convert second argument to a number
sum = x + y       # Add the arguments
puts sum          # Print the sum
---------------------------
if <replaceable>expression</replaceable>
  <replaceable>code</replaceable>
end
---------------------------
# If x is less than 10, increment it
if x < 10                     # newline separator
  x += 1
end
if x < 10 then x += 1 end     # then separator
---------------------------
if x < 10 then
  x += 1
end
---------------------------
if <replaceable>expression</replaceable>
  <replaceable>code</replaceable>
else
  <replaceable>code</replaceable>
end
---------------------------
if data         # If the array exists
  data << x     #   then append a value to it.
else            # Otherwise...
  data = [x]    #   create a new array that holds the value.
end             # This is the end of the conditional.
---------------------------
if <replaceable>expression1</replaceable>
  <replaceable>code1</replaceable>
elsif <replaceable>expression2</replaceable>
  <replaceable>code2</replaceable>
      .
      .
      .
elsif <replaceable>expressionN</replaceable>
  <replaceable>codeN</replaceable>
else
  <replaceable>code</replaceable>
end
---------------------------
if x == 1
  name = "one"
elsif x == 2
  name = "two"
elsif x == 3 then name = "three"
elsif x == 4; name = "four"
else
  name = "many"
end
# Remember every expression has a value in Ruby
---------------------------
name = if    x == 1 then "one"
       elsif x == 2 then "two"
       elsif x == 3 then "three"
       elsif x == 4 then "four"
       else              "many"
       end
---------------------------
if <replaceable>expression</replaceable> then <replaceable>code</replaceable> end
---------------------------
<replaceable>code</replaceable> if <replaceable>expression</replaceable>
---------------------------
puts message if message    # Output message, if it is defined
---------------------------
puts message        # Unconditional
if message          # Incomplete!
---------------------------
y = x.invert if x.respond_to? :invert
y = (x.invert if x.respond_to? :invert)
---------------------------
if expression     begin                (
  line1             line1                line1
  line2             line2                line2
end               end if expression    ) end if expression
---------------------------
# Output message if message exists and the output method is defined
puts message if message if defined? puts
---------------------------
puts message if message and defined? puts
---------------------------
# single-way unless statement
# unless, as a statement or modifier, is the opposite of if: it executes the code only if an associated condition is false or nil.

unless <replaceable>condition</replaceable>
  <replaceable>code</replaceable>
end

# two-way unless statement
unless <replaceable>condition</replaceable>
  <replaceable>code</replaceable>
else
  <replaceable>code</replaceable>
end

# unless modifier
<replaceable>code</replaceable> unless <replaceable>condition</replaceable>
---------------------------
# Call the to_s method on object o, unless o is nil
s = unless o.nil?                        # newline separator
  o.to_s
end
s = unless o.nil? then o.to_s end        # then separator
---------------------------
s = o.to_s unless o.nil?
---------------------------
unless x == 0
  puts "x is not 0"
else
  unless y == 0
    puts "y is not 0"
  else
    unless z == 0
      puts "z is not 0"
    else
      puts "all are 0"
    end
  end
end
---------------------------
name = case                           name = if    x == 1 then "one"
       when x == 1 then "one"                elsif x == 2 then "two"
       when x == 2 then "two"                elsif x == 3 then "three"
       when x == 3 then "three"              elsif x == 4 then "four"
       when x == 4 then "four"               else "many"
       else "many"                           end
       end
---------------------------
case 
when x == 1
  "one"
when x == 2 
  "two"
when x == 3
  "three"
end
---------------------------
case
when x == 1, y == 0 then  "x is one or y is zero"  # Obscure syntax
when x == 2 || y == 1 then "x is two or y is one"  # Easier to understand
end
---------------------------
name = case x
       when 1             # Just the value to compare to x
         "one"
       when 2 then "two"  # Then keyword instead of newline
       when 3; "three"    # Semicolon instead of newline
       else "many"        # Optional else clause at end
       end
---------------------------
#The important thing to understand that the operator === is used to comapare when expression values with case expression.
# The following expression is how the ruby interprets the expression above.
name = case
       when 1 === x then "one"
       when 2 === x then "two"
       when 3 === x then "three"
       else "many"
       end
---------------------------
# Take different actions depending on the class of x
# The Class class defines === so that it tests whether the righthand operansd is an instance of the class named by the lefthand operand.

puts case x
     when String then "string"
     when Numeric then "number"
     when TrueClass, FalseClass then "boolean"
     else "other"
     end

# Compute 2006 U.S. income tax using case and Range objects
# The Range class defines === to see that the value on the right (income) matches within the range on left.
tax = case income
      when 0..7550
        income * 0.1
      when 7550..30650
        755 + (income-7550)*0.15
      when 30650..74200
        4220 + (income-30655)*0.25
      when 74200..154800
        15107.5 + (income-74201)*0.28
      when 154800..336550
        37675.5 + (income-154800)*0.33
      else
        97653 + (income-336550)*0.35
      end

# Regexp defines === so that it tests whether value on right (line) amatches the pattern on the left.
# Get user's input and process it, ignoring comments and exiting
# when the user enters the word "quit"
while line=gets.chomp do  # Loop, asking the user for input each time
  case line
  when /^\s*#/            # If input looks like a comment...
      next                #   skip to the next line.
  when /^quit$/i          # If input is "quit" (case insensitive)...
    break                 #   exit the loop.
  else                    # Otherwise...
    puts line.reverse     #   reverse the user's input and print it.
  end
end
---------------------------
def hasValue?(x)         # Define a method named hasValue?
  case x                 # Multiway conditional based on value of x
  when nil, [], "", 0    # if nil===x || []===x || ""===x || 0===x then
    false                #   method return value is false
  else                   # Otherwise
    true                 #   method return value is true
  end
end
---------------------------
def how_many_messages(n) # Handle singular/plural 
  "You have " + n.to_s + (n==1 ? " message." : " messages.")
end
---------------------------
x = 10               # Initialize a loop counter variable
while x >= 0 do      # Loop while x is greater than or equal to 0
  puts x             #   Print out the value of x
  x = x - 1          #   Subtract 1 from x
end                  # The loop ends here

# Count back up to 10 using an until loop
x = 0                # Start at 0 (instead of -1)
until x > 10 do      # Loop until x is greater than 10
  puts x
  x = x + 1
end                  # Loop ends here
---------------------------
x = 0                          # Initialize loop variable
puts x = x + 1 while x < 10    # Output and increment in a single expression
---------------------------
x = 0
while x < 10 do puts x = x + 1 end
---------------------------
a = [1,2,3]                 # Initialize an array
puts a.pop until a.empty?   # Pop elements from array until empty
---------------------------
# Future release may forbid the use of while/until modifiers with begin/end.
# This is a replica of do/while in C or C++.
x = 10              # Initialize loop variable
begin               # Start a compound expression: executed at least once
  puts x            #   output x
  x = x - 1         #   decrement x
end until x == 0    # End compound expression and modify it with a loop
---------------------------
x = 0               # Initialize loop variable
(                   # Start a compound expression: may be executed 0 times
  puts x            #   output x
  x = x - 1         #   decrement x
) until x == 0      # End compound expression and modify it with a loop
---------------------------
for <replaceable>var</replaceable> in <replaceable>collection</replaceable> do
  <replaceable>body</replaceable>
end
---------------------------
# Print the elements in an array
array = [1,2,3,4,5]
for element in array 
  puts element
end

# Print the keys and values in a hash
hash = {:a=>1, :b=>2, :c=>3}
for key,value in hash
  puts "#{key} => #{value}"
end
---------------------------
hash = {:a=>1, :b=>2, :c=>3}
hash.each do |key,value|
  puts "#{key} => #{value}"
end
---------------------------
# It is more common to write loops using iterators rather than while,until, for.
# The complex control behind this is yield.
# The term iterator is used to mean any method that uses yield.

3.times { puts "thank you!" }  # Express gratitude three times
data.each {|x| puts x }        # Print each element x of data
[1,2,3].map {|x| x*x }         # Compute squares of array elements
factorial = 1                  # Compute the factorial of n
2.upto(n) {|x| factorial *= x }
---------------------------
# The tap method, an iteraotor defined in Object class, takes the receiver and returns the receiver. 
chars = "hello world".tap {|x| puts "original object: #{x.inspect}"}
  .each_char         .tap {|x| puts "each_char returns: #{x.inspect}"}
  .to_a              .tap {|x| puts "to_a returns: #{x.inspect}"}
  .map {|c| c.succ } .tap {|x| puts "map returns: #{x.inspect}" }
  .sort              .tap {|x| puts "sort returns: #{x.inspect}"}
---------------------------
4.upto(6) {|x| print x}   # => prints "456"
6.downto(4) {|x| print x}# => prints "654"

---------------------------
3.times {|x| print x }    # => prints "012"
is equivalent to
0.upto(2){|x| print x }
---------------------------
0.step(Math::PI, 0.1) {|x| puts Math.sin(x) }
---------------------------
# Array, Hash, Range and a number of other classes define an each iterator which passes each element of the collection to the block

[1,2,3].each {|x| print x }   # => prints "123"
(1..3).each  {|x| print x }   # => prints "123" Same as 1.upto(3)
---------------------------
File.open(filename) do |f|       # Open named file, pass as f
  f.each {|line| print line }    # Print each line in f
end                              # End block and close file
---------------------------
File.open(filename) do |f|
  f.each_with_index do |line,number|
    print "#{number}: #{line}"
  end
end
---------------------------
squares = [1,2,3].collect {|x| x*x}   # => [1,4,9]
---------------------------
evens = (1..10).select {|x| x%2 == 0} # => [2,4,6,8,10]
---------------------------
odds = (1..10).reject {|x| x%2 == 0}  # => [1,3,5,7,9]

---------------------------
# The inject method takes two arguments. The first arguments is an acculumalated value of some sort from previous iterations and also is the value returned after last iteration.

data = [2, 5, 3, 4]
sum = data.inject {|sum, x| sum + x }      # => 14    (2+5+3+4)
sum = data.inject(10) {|sum, x| sum + x }      # => 24    (10+2+5+3+4)
floatprod = data.inject(1.0) {|p,x| p*x }  # => 120.0 (1.0*2*5*3*4)
max = data.inject {|m,x| m>x ? m : x }     # => 5     (largest element)

---------------------------
def twice
  yield
  yield
end
---------------------------
# The defining feature of an iterator is that it invokes a block of code associated with the method incocation.

# This method expects a block. It generates n values of the form
# m*i + c, for i from 0..n-1, and yields them, one at a time, 
# to the associated block.
def sequence(n, m, c)
  i = 0
  while(i < n)      # Loop n times
    yield m*i + c   # Invoke the block, and pass a value to it
    i += 1          # Increment i each time
  end
end

# Here is an invocation of that method, with a block.
# It prints the values 1, 6, and 11
sequence(3, 5, 1) {|y| puts y }
---------------------------
# Generate n points evenly spaced around the circumference of a 
# circle of radius r centered at (0,0). Yield the x and y coordinates
# of each point to the associated block.
def circle(r,n)
  n.times do |i|    # Notice that this method is implemented with a block
    angle = Math::PI * 2 * i / n
    yield r*Math.cos(angle), r*Math.sin(angle)
  end
end

# This invocation of the iterator prints:
# (1.00, 0.00) (0.00, 1.00) (-1.00, 0.00) (-0.00, -1.00)
circle(1,4) {|x,y| printf "(%.2f, %.2f) ", x, y }
---------------------------
# Return an array with n elements of the form m*i+c
# If a block is given, also yield each element to the block
def sequence(n, m, c)
  i, s = 0, []                  # Initialize variables
  while(i < n)                  # Loop n times
    y = m*i + c                 # Compute value
    yield y if block_given?     # Yield, if block
    s << y                      # Store the value
    i += 1
  end
  s                             # Return the array of values
end
---------------------------
# Call this method with an Enumerator instead of a mutable array.
# This is a useful defensive strategy to avoid bugs.
process(data.to_enum)  # Instead of just process(data)
---------------------------
s = "hello"
s.enum_for(:each_char).map {|c| c.succ }  # => ["i", "f", "m", "m", "p"]
---------------------------
process(data.each_char)  # Instead of just process(data)
---------------------------
"hello".chars.map {|c| c.succ }  # => ["i", "f", "m", "m", "p"]
---------------------------
enumerator = 3.times             # An enumerator object
enumerator.each {|x| print x }   # Prints "012"

# downto returns an enumerator with a select method
10.downto(1).select {|x| x%2==0}  # => [10,8,6,4,2]

# each_byte iterator returns an enumerator with a to_a method
"hello".each_byte.to_a            # => [104, 101, 108, 108, 111]
---------------------------
def twice
  if block_given?
    yield
    yield
  else
    self.to_enum(:twice)    
  end
end
---------------------------
enumerator = s.each_char.with_index
---------------------------
for line, number in text.each_line.with_index
  print "#{number+1}: #{line}"
end
---------------------------
iterator = 9.downto(1)             # An enumerator as external iterator
begin                              # So we can use rescue below
  print iterator.next while true   # Call the next method repeatedly
rescue StopIteration               # When there are no more values
  puts "...blastoff!"              # An expected, nonexceptional condition
end
---------------------------
iterator = 9.downto(1)
loop do                 # Loop until StopIteration is raised
  print iterator.next   # Print next item
end
puts "...blastoff!"
---------------------------
module Iterable
  include Enumerable          # Define iterators on top of each
  def each                    # And define each on top of next
    loop { yield self.next }
  end
end
---------------------------
def iterate(iterator)
  loop { yield iterator.next }
end

iterate(9.downto(1)) {|x| print x }
---------------------------
# Call the each method of each collection in turn.
# This is not a parallel iteration and does not require enumerators.
def sequence(*enumerables, &block)
  enumerables.each do |enumerable|
    enumerable.each(&block)
  end
end

# Iterate the specified collections, interleaving their elements.
# This can't be done efficiently without external iterators.
# Note the use of the uncommon else clause in begin/rescue.
def interleave(*enumerables)
  # Convert enumerable collections to an array of enumerators.
  enumerators = enumerables.map {|e| e.to_enum }
  # Loop until we don't have any more enumerators.
  until enumerators.empty?
    begin
      e = enumerators.shift   # Take the first enumerator
      yield e.next            # Get its next and pass to the block
    rescue StopIteration      # If no more elements, do nothing
    else                      # If no exception occurred
      enumerators << e        # Put the enumerator back
    end
  end
end

# Iterate the specified collections, yielding tuples of values,
# one value from each of the collections. See also Enumerable.zip.
def bundle(*enumerables)
  enumerators = enumerables.map {|e| e.to_enum }
  loop { yield enumerators.map {|e| e.next} }
end

# Examples of how these iterator methods work
a,b,c = [1,2,3], 4..6, 'a'..'e'
sequence(a,b,c) {|x| print x}   # prints "123456abcde"
interleave(a,b,c) {|x| print x} # prints "14a25b36cde"
bundle(a,b,c) {|x| print x}     # '[1, 4, "a"][2, 5, "b"][3, 6, "c"]'
---------------------------
a = [1,2,3,4,5]
a.each {|x| puts "#{x},#{a.shift}" }  # prints "1,1\n3,2\n5,3"
---------------------------
module Enumerable
  def each_in_snapshot &block
    snapshot = self.dup    # Make a private copy of the Enumerable object
    snapshot.each &block   # And iterate on the copy
  end
end
---------------------------
# Print the numbers 1 to 10
1.upto(10) {|x| puts x }   # Invocation and block on one line with braces
1.upto(10) do |x|          # Block delimited with do/end
  puts x
end
1.upto(10)                 # No block specified
 {|x| puts x }             # Syntax error: block not after an invocation
---------------------------
1.upto(3) {|x| puts x }    # Parens and curly braces work
1.upto 3 do |x| puts x end # No parens, block delimited with do/end
1.upto 3 {|x| puts x }     # Syntax Error: trying to pass a block to 3!
---------------------------
# The Hash.each iterator passes two arguments to its block
hash.each do |key, value|   # For each (key,value) pair in the hash
  puts "#{key}: #{value}"   # Print the key and the value
end                         # End of the block
---------------------------
# The block takes two words and "returns" their relative order
words.sort! {|x,y| y <=> x }
---------------------------
array.collect do |x|
  next 0 if x == nil  # Return prematurely if x is nil
  next x, x*x         # Return two values
end
---------------------------
array.collect do |x|
  if x == nil
    0
  else
    [x, x*x]
  end
end
---------------------------
total = 0   
data.each {|x| total += x }  # Sum the elements of the data array
puts total                   # Print out that sum
---------------------------
1.upto(10) do |i|         # 10 rows
  1.upto(10) do |i|       # Each has 10 columns
    print "#{i} "         # Print column number
  end
  print " ==> Row #{i}\n" # Try to print row number, but get column number
end
---------------------------
x = y = 0            # local variables
1.upto(4) do |x;y|   # x and y are local to block
                     # x and y "shadow" the outer variables
  y = x + 1          # Use y as a scratch variable
  puts y*y           # Prints 4, 9, 16, 25
end
[x,y]                # => [0,0]: block does not alter these
---------------------------
hash.each {|key,value; i,j,k| ... }
---------------------------
key,value = k,v
---------------------------
{:one=>1}.each_pair {|key,value| ... } # key=:one, value=1
---------------------------
{:one=>1}.each_pair {|$key, @value| ... } # No longer works in Ruby 1.9
---------------------------
hash.each {|k,v| ... }  # key and value assigned to params k and v
---------------------------
k,v = [key, value]
---------------------------
def two; yield 1,2; end  # An iterator that yields two values
two {|x| p x }     # Ruby 1.8: warns and prints [1,2],
two {|x| p x }     # Ruby 1.9: prints 1, no warning
two {|*x| p x }    # Either version: prints [1,2]; no warning
two {|x,| p x }    # Either version: prints 1; no warning
---------------------------
def five; yield 1,2,3,4,5; end     # Yield 5 values
five do |head, *body, tail|        # Extra values go into body array
  print head, body, tail           # Prints "1[2,3,4]5"
end
---------------------------
def hashiter; yield :a=>1, :b=>2; end  # Note no curly braces
hashiter {|hash| puts hash[:a] }       # Prints 1
---------------------------
# This Proc expects a block 
printer = lambda {|&b| puts b.call } # Print value returned by b
printer.call { "hi" }                # Pass a block to the block!
---------------------------
[1,2,3].each {|x,y=10| print x*y }     # SyntaxError!
---------------------------
[1,2,3].each &->(x,y=10) { print x*y }  # Prints "102030"
---------------------------
# Return two copies of x, if x is not nil
def double(x)
  return nil if x == nil   # Return prematurely
  return x, x.dup          # Return multiple values
end
---------------------------
# Return the index of the first occurrence of target within array or nil
# Note that this code just duplicates the Array.index method
def find(array, target)
  array.each_with_index do |element,index|
    return index if (element == target)  # return from find
  end
  nil  # If we didn't find the element, return nil
end
---------------------------
while(line = gets.chop)     # A loop starts here
  break if line == "quit"   # If this break statement is executed...
  puts eval(line)
end
puts "Good bye"             # ...then control is transferred here
---------------------------
f.each do |line|             # Iterate over the lines in file f
  break if line == "quit\n"  # If this break statement is executed...
  puts eval(line)
end
puts "Good bye"              # ...then control is transferred here
---------------------------
while(line = gets.chop)     # A loop starts here
  next if line[0,1] == "#"  # If this line is a comment, go on to the next
  puts eval(line)
  # Control goes here when the next statement is executed
end
---------------------------
f.each do |line|              # Iterate over the lines in file f
  next if line[0,1] == "#"    # If this line is a comment, go to the next
  puts eval(line)
  # Control goes here when the next statement is executed
end
---------------------------
squareroots = data.collect do |x|
  next 0 if x < 0  # Return 0 for negative values
  Math.sqrt(x)
end
---------------------------
squareroots = data.collect do |x|
  if (x < 0) then 0 else Math.sqrt(x) end
end
---------------------------
i = 0
while(i < 3)   # Prints "0123" instead of "012"
  # Control returns here when redo is executed
  print i
  i += 1
  redo if i == 3
end
---------------------------
puts "Please enter the first word you think of"
words = %w(apple banana cherry)   # shorthand for ["apple", "banana", "cherry"]
response = words.collect do |word|
  # Control returns here when redo is executed
  print word + "> "               # Prompt the user
  response = gets.chop            # Get a response
  if response.size == 0           # If user entered nothing
    word.upcase!                  # Emphasize the prompt with uppercase
    redo                          # And skip to the top of the block
  end
  response                        # Return the response
end
---------------------------
n = 10
n.times do |x|   # Iterate n times from 0 to n&#x2013;1
  print x        # Print iteration number
  if x == 9      # If we've reached 9
    n -= 1       # Decrement n (we won't reach 9 the next time!)
    retry        # Restart the iteration
  end
end
---------------------------
# This method behaves like a while loop: if x is non-nil and non-false,
# invoke the block and then retry to restart the loop and test the
# condition again. This method is slightly different than a true while loop: 
# you can use C-style curly braces to delimit the loop body. And
# variables used only within the body of the loop remain local to the block.
def repeat_while(x)
  if x     # If the condition was not nil or false
    yield  # Run the body of the loop
    retry  # Retry and re-evaluate loop condition
  end
end
---------------------------
for matrix in data do             # Process a deeply nested data structure.
  catch :missing_data do          # Label this statement so we can break out.
    for row in matrix do
      for value in row do
        throw :missing_data unless value # Break out of two loops at once.
        # Otherwise, do some actual data processing here.
      end
    end
  end
  # We end up here after the nested loops finish processing each matrix.
  # We also get here if :missing_data is thrown.
end
---------------------------
Object
 +--Exception
     +--NoMemoryError
     +--ScriptError
     |   +--LoadError
     |   +--NotImplementedError
     |   +--SyntaxError
     +--SecurityError         # Was a StandardError in 1.8
     +--SignalException
     |   +--Interrupt
     +--SystemExit
     +--SystemStackError      # Was a StandardError in 1.8
     +--StandardError
         +--ArgumentError
         +--FiberError        # New in 1.9
         +--IOError
         |   +--EOFError
         +--IndexError
         |   +--KeyError      # New in 1.9
         |   +--StopIteration # New in 1.9
         +--LocalJumpError
         +--NameError
         |   +--NoMethodError
         +--RangeError
         |   +--FloatDomainError
         +--RegexpError
         +--RuntimeError
         +--SystemCallError
         +--ThreadError
         +--TypeError
         +--ZeroDivisionError
---------------------------
<replaceable>filename</replaceable> : <replaceable>linenumber</replaceable> in <replaceable>methodname</replaceable>
---------------------------
class MyError < StandardError; end
---------------------------
def factorial(n)                 # Define a factorial method with argument n
  raise "bad argument" if n < 1  # Raise an exception for bad n
  return 1 if n == 1             # factorial(1) is 1
  n * factorial(n-1)             # Compute other factorials recursively
end
---------------------------
raise RuntimeError, "bad argument" if n < 1
raise RuntimeError.new("bad argument") if n < 1
raise RuntimeError.exception("bad argument") if n < 1
---------------------------
raise ArgumentError if n < 1
---------------------------
raise ArgumentError, "Expected argument >= 1. Got #{n}" if n < 1
---------------------------
if n < 1
  raise ArgumentError, "Expected argument >= 1. Got #{n}", caller
end
---------------------------
raise TypeError, "Integer argument expected" if not n.is_a? Integer
---------------------------
begin
  # Any number of Ruby statements go here.
  # Usually, they are executed without exceptions and
  # execution continues after the end statement.
rescue
  # This is the rescue clause; exception-handling code goes here.
  # If an exception is raised by the code above, or propagates up
  # from one of the methods called above, then execution jumps here.
end
---------------------------
require 'English'
---------------------------
rescue => ex
---------------------------
begin                                # Handle exceptions in this block
  x = factorial(-1)                  # Note illegal argument
rescue => ex                         # Store exception in variable ex
  puts "#{ex.class}: #{ex.message}"  # Handle exception by printing message
end                                  # End the begin/rescue block
---------------------------
rescue Exception
---------------------------
rescue ArgumentError => e
---------------------------
rescue ArgumentError, TypeError => error
---------------------------
begin
  x = factorial(1)
rescue ArgumentError => ex
  puts "Try again with a value >= 1"
rescue TypeError => ex
  puts "Try again with an integer"
end
---------------------------
def explode        # This method raises a RuntimeError 10% of the time
  raise "bam!" if rand(10) == 0
end

def risky   
  begin            # This block
    10.times do    # contains another block
      explode      # that might raise an exception.
    end            # No rescue clause here, so propagate out.
  rescue TypeError # This rescue clause cannot handle a RuntimeError..
    puts $!        # so skip it and propagate out.
  end              
  "hello"          # This is the normal return value, if no exception occurs.
end                # No rescue clause here, so propagate up to caller.

def defuse
  begin                     # The following code may fail with an exception.
    puts risky              # Try to invoke print the return value.
  rescue RuntimeError => e  # If we get an exception
    puts e.message          # print the error message instead.
  end                       
end

defuse
---------------------------
require 'open-uri'

tries = 0       # How many times have we tried to read the URL
begin           # This is where a retry begins
  tries += 1    # Try to print out the contents of a URL
  open('http://www.example.com/') {|f| puts f.readlines }
rescue OpenURI::HTTPError => e  # If we get an HTTP error
  puts e.message                # Print the error message
  if (tries < 4)                # If we haven't tried 4 times yet...
    sleep(2**tries)             # Wait for 2, 4, or 8 seconds
    retry                       # And then try again!
  end
end
---------------------------
begin
  return 1     # Skip to the ensure clause before returning to caller
ensure
  return 2     # Replace the return value with this new value
end
---------------------------
def test
  begin return 1 ensure 2 end
end
---------------------------
def method_name(x)
  # The body of the method goes here.
  # Usually, the method body runs to completion without exceptions
  # and returns to its caller normally.
rescue 
  # Exception-handling code goes here.
  # If an exception is raised within the body of the method, or if
  # one of the methods it calls raises an exception, then control
  # jumps to this block.
else
  # If no exceptions occur in the body of the method
  # then the code in this clause is executed.
ensure
  # The code in this clause is executed no matter what happens in the
  # body of the method. It is run if the method runs to completion, if 
  # it throws an exception, or if it executes a return statement.
end
---------------------------
# Compute factorial of x, or use 0 if the method raises an exception
y = factorial(x) rescue 0
---------------------------
y = begin
      factorial(x)
    rescue
      0
    end
---------------------------
BEGIN {
  # Global initialization code goes here
}

END {
  # Global shutdown code goes here
}
---------------------------
if (false) 
  BEGIN {
    puts "if";                   # This will be printed
    a = 4;                       # This variable only defined here
  }
else
  BEGIN { puts "else" }          # Also printed
end

10.times {BEGIN { puts "loop" }} # Only printed once
---------------------------
a = 4;
if (true) 
  END {                        # This END is executed
    puts "if";                 # This code is registered
    puts a                     # The variable is visible; prints "4"
  }
else
  END { puts "else" }          # This is not executed
end
10.times {END { puts "loop" }} # Only executed once
---------------------------
# This method expects an array of filenames.
# It returns an array of strings holding the content of the named files.
# The method creates one thread for each named file.
def readfiles(filenames)
  # Create an array of threads from the array of filenames.
  # Each thread starts reading a file.
  threads = filenames.map do |f|
    Thread.new { File.read(f) }
  end

  # Now create an array of file contents by calling the value
  # method of each thread. This method blocks, if necessary,
  # until the thread exits with a value.
  threads.map {|t| t.value }
end

#Ruby 1.9 introduces Fiber class.
# These are co-routines or semi-coroutines.  Many of Ruby programmers may never need to use it.
# Thed most common use is to implement generators: objects that can compute a partial result, yield the result back to the caller and save the state 
# of computation to obtain the next result.
---------------------------
f = Fiber.new {              # Line  1: Create a new fiber
  puts "Fiber says Hello"    # Line  2:
  Fiber.yield                # Line  3: goto line 9 
  puts "Fiber says Goodbye"  # Line  4:
}                            # Line  5: goto line 11
                             # Line  6:
puts "Caller says Hello"     # Line  7:
f.resume                     # Line  8: goto line 2
puts "Caller says Goodbye"   # Line  9:
f.resume                     # Line 10: goto line 4
                             # Line 11:
---------------------------
Caller says Hello
Fiber says Hello
Caller says Goodbye
Fiber says Goodbye
---------------------------
f = Fiber.new do |message|
  puts "Caller said: #{message}"
  message2 = Fiber.yield("Hello")    # "Hello" returned by first resume
  puts "Caller said: #{message2}"
  "Fine"                             # "Fine" returned by second resume
end

response = f.resume("Hello")         # "Hello" passed to block 
puts "Fiber said: #{response}"
response2 = f.resume("How are you?") # "How are you?" returned by Fiber.yield
puts "Fiber said: #{response2}"
---------------------------
Caller said: Hello
Fiber said: Hello
Caller said: How are you?
Fiber said: Fine
---------------------------
# Return a Fiber to compute Fibonacci numbers
def fibonacci_generator(x0,y0)   # Base the sequence on x0,y0
  Fiber.new do
    x,y = x0, y0                 # Initialize x and y
    loop do                      # This fiber runs forever
      Fiber.yield y              # Yield the next number in the sequence
      x,y = y,x+y                # Update x and y
    end
  end
end

g = fibonacci_generator(0,1)     # Create a generator 
10.times { print g.resume, " " } # And use it
---------------------------
1 1 2 3 5 8 13 21 34 55
---------------------------
class FibonacciGenerator
  def initialize
    @x,@y = 0,1
    @fiber = Fiber.new do
      loop do 
        @x,@y = @y, @x+@y
        Fiber.yield @x
      end
    end
  end

  def next           # Return the next Fibonacci number
    @fiber.resume
  end

  def rewind         # Restart the sequence
    @x,@y = 0,1
  end
end

g = FibonacciGenerator.new      # Create a generator
10.times { print g.next, " " }  # Print first 10 numbers
g.rewind; puts                  # Start over, on a new line
10.times { print g.next, " " }  # Print the first 10 again
---------------------------
def each
   loop { yield self.next }
end
---------------------------
class Generator
  def initialize(enumerable)
    @enumerable = enumerable  # Remember the enumerable object
    create_fiber              # Create a fiber to enumerate it
  end

  def next                    # Return the next element
    @fiber.resume             # by resuming the fiber
  end

  def rewind                  # Start the enumeration over
    create_fiber              # by creating a new fiber
  end

  private
  def create_fiber            # Create the fiber that does the enumeration
    @fiber = Fiber.new do     # Create a new fiber
      @enumerable.each do |x| # Use the each method
        Fiber.yield(x)        # But pause during enumeration to return values
      end              
      raise StopIteration     # Raise this when we're out of values
    end
  end
end

g = Generator.new(1..10)  # Create a generator from an Enumerable like this
loop { print g.next }     # And use it like an enumerator like this
g.rewind                  # Start over like this
g = (1..10).to_enum       # The to_enum method does the same thing
loop { print g.next }


---------------------------
require 'fiber'
---------------------------
require 'fiber'

f = g = nil

f = Fiber.new {|x|        # 1: 
  puts "f1: #{x}"         # 2: print "f1: 1"
  x = g.transfer(x+1)     # 3: pass 2 to line 8
  puts "f2: #{x}"         # 4: print "f2: 3"
  x = g.transfer(x+1)     # 5: return 4 to line 10
  puts "f3: #{x}"         # 6: print "f3: 5"
  x + 1                   # 7: return 6 to line 13
}
g = Fiber.new {|x|        # 8:
  puts "g1: #{x}"         # 9: print "g1: 2"
  x = f.transfer(x+1)     #10: return 3 to line 3
  puts "g2: #{x}"         #11: print "g2: 4"
  x = f.transfer(x+1)     #12: return 5 to line 5
}
puts f.transfer(1)        #13: pass 1 to line 1
---------------------------
f1: 1
g1: 2
f2: 3
g2: 4
f3: 5
6
---------------------------
require 'continuation'
---------------------------
# Global hash for mapping line numbers (or symbols) to continuations
$lines = {}  

# Create a continuation and map it to the specified line number
def line(symbol)
  callcc  {|c| $lines[symbol] = c }
end

# Look up the continuation associated with the number, and jump there
def goto(symbol)
  $lines[symbol].call
end

# Now we can pretend we're programming in BASIC
i = 0
line 10              # Declare this spot to be line 10
puts i += 1
goto 10 if i < 5     # Jump back to line 10 if the condition is met

line 20              # Declare this spot to be line 20
puts i -= 1
goto 20 if i > 0
---------------------------
puts; puts ; out = gets
