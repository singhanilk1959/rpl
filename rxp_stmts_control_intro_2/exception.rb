#!/usr/bin/env ruby
puts %q^
^
puts %q^

  An exception is an object that represents some kind of exceptional condition.
  It indicates that something has gone wrong.

  By default, Ruby programs terminate when an exception occurs. 

  But, it is possible to declare exception handlers: a block of code that is 
  exceted when exception occurs.

 Ruby uses the Kernel method raise to raise exceptions, and uses rescue clause
 to handle exceptions.
^
gets
puts %q^
***************************
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
^
gets
puts %q^

  It is  important to note that most of these subclasses extend class known 
  as StandardError. These are normal exceptions that typical Ruby programs 
  try to handle. Others represent low level error that normal Ruby programs 
  do not try to handle.


 Defining New Exception classes

  class MyError < StandardError; end
^
gets

puts %q^
---------------------------
class MyError < StandardError; end

***************************

^

puts ; gets
puts %q^
***************************


# Exception objects are typically created by Kernel method #raise or its synonym #fail.
# But you can create your own objects with #new or with
# another class method #exception with a single optional String argument.
#
# 1. #raise with no arguments create RuntimeError object with no message and raises it.
# 2. #raise without arguments in a rescue clause: reraises the exception being handled.
# 3. #raise with an object (Exception Class or its subclasses) that has #exception method 
#     defined invokes the exception method  and raises the returned Exception object.
# 4. #raise with an Exception object raises that exception.

def factorial(n)                 # Define a factorial method with argument n
  raise "bad argument" if n < 1  # Raise an exception for bad n (#1 raises RuntimeError)
  return 1 if n == 1             # factorial(1) is 1
  n * factorial(n-1)             # Compute other factorials recursively
end
---------------------------
# Exampls of #3 : the standard way to create exception

raise RuntimeError, "bad argument" if n < 1
raise RuntimeError.new("bad argument") if n < 1
raise RuntimeError.exception("bad argument") if n < 1
---------------------------
raise ArgumentError if n < 1
fail  ArgumentError if n < 1 # both statements are same as fail is synonym for raise
---------------------------
raise ArgumentError, "Expected argument >= 1. Got #{n}" if n < 1
---------------------------
if n < 1
  raise ArgumentError, "Expected argument >= 1. Got #{n}", caller
end
---------------------------
raise TypeError, "Integer argument expected" if not n.is_a? Integer
---------------------------

^
puts ; gets
puts %q^
# rescue is not an statement in its own right, but rather a clause that can be attached to other
# ruby statements, but is generally used with begin statement.
begin
  # Any number of Ruby statements go here.
  # Usually, they are executed without exceptions and
  # execution continues after the end statement.
rescue
  # This is the rescue clause; exception-handling code goes here.
  # If an exception is raised by the code above, or propagates up
  # from one of the methods called above, then execution jumps here.
end

# In the rescue clause, the global variable $! or $ERROR_INFO (with 'require 'English')
# refers to the Exception object that being handled.
---------------------------

***************************
^
puts ; gets
puts %q^
***************************
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
# rescue without any Exception class handles only StandardError and subclasses.
rescue
rescue Exception                     # handle any kind of exception
---------------------------
rescue ArgumentError => e            # handles only ArgumentError
---------------------------
rescue ArgumentError, TypeError => error # handles ArgumentError, TypeError
---------------------------
begin
  x = factorial(1)
rescue ArgumentError => ex
  puts "Try again with a value >= 1"
rescue TypeError => ex
  puts "Try again with an integer"
rescue Exception
  raise  # exit whatever want to do here
end

# Ruby attempts to match exceptions to rescue clauses in the order they are written.
# So, you should write most specific exception subclasses first and follow up with more
# general classes.
# Use rescue Exception  as a last clause for catch all situations.
***************************
^
puts ; gets
puts %q^
***************************
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

***************************
^
puts ; gets
puts %q^
***************************
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

***************************
^
puts ; gets
puts %q^
***************************

***************************
^
puts ; gets
puts %q^
***************************
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

***************************
^
puts ; gets
puts %q^
***************************
# rescue can also be used as an statement modifier. 
# when used this way, rescue must be used alone with no exception names, variable
# it handles any StandardException error 
---------------------------
# Compute factorial of x, or use 0 if the method raises an exception
y = factorial(x) rescue 0

is eqivalent to

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

***************************
^
