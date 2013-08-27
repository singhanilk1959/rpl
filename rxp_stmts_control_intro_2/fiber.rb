#!/usr/bin/env ruby
puts ; gets
puts %q^
***************************
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

***************************
^
puts ; gets
puts %q^
***************************
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

***************************
^
puts ; gets
puts %q^
***************************
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

***************************
^
puts ; gets
puts %q^
***************************
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

***************************
^
puts ; gets
puts %q^
***************************
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

***************************
^
puts ; gets
puts %q^
***************************

***************************
^
puts ; gets
__END__
