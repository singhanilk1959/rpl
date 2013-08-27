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
puts %q^

  It is  important to note that most of these subclasses extend class known 
  as StandardError. These are normal exceptions that typical Ruby programs 
  try to handle. Others represent low level error that normal Ruby programs 
  do not try to handle.


 Defining New Exception classes

  class MyError < StandardError; end
^

puts %q^

  The 
^

---------------------------
class MyError < StandardError; end

***************************
^
puts ; gets
puts %q^
***************************
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

***************************
^
puts ; gets
puts %q^
***************************
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

***************************
^
