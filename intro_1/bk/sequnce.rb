#!/usr/bin/env ruby
#
# This class represents a sequence of numbers characterized by the three
# parameters from, to, and by. The numbers x in the sequence obey the
# following two constraints:
#
#    from <= x <= to
#    x = from + n*by, where n is an integer
# 
class Sequence
  # This is an enumerable class; it defines an each iterator below.
  include Enumerable   # Include the methods of this module in this class

  # The initialize method is special; it is automatically invoked to
  # initialize newly created instances of the class
  def initialize(from, to, by)
    # Just save our parameters into instance variables for later use
    @from, @to, @by = from, to, by  # Note parallel assignment and @ prefix
  end

  # This is the iterator required by the Enumerable module
  def each
    x = @from       # Start at the starting point
    while x <= @to  # While we haven't reached the end
      yield x       # Pass x to the block associated with the iterator
      x += @by      # Increment x
    end
  end

  # Define the length method (following arrays) to return the number of
  # values in the sequence
  def length
    return 0 if @from > @to       # Note if used as a statement modifier 
    Integer((@to-@from)/@by) + 1  # Compute and return length of sequence
  end

  # Define another name for the same method.
  # It is common for methods to have multiple names in Ruby
  alias size length  # size is now a synonym for length

  # Override the array-access operator to give random access to the sequence
  def[](index)
    return nil if index < 0 # Return nil for negative indexes
    v = @from + index*@by   # Compute the value
    if v <= @to             # If it is part of the sequence
      v                     # Return it
    else                    # Otherwise...
      nil                   # Return nil
    end
  end

  # Override arithmetic operators to return new Sequence objects
  def *(factor)
    Sequence.new(@from*factor, @to*factor, @by*factor)
  end

  def +(offset)
    Sequence.new(@from+offset, @to+offset, @by)
  end
end
#---------------------------
s = Sequence.new(1, 10, 2)  # From 1 to 10 by 2's
s.each {|x| print x }       # Prints "13579"
puts
print s[s.size-1]           # Prints 9
puts
t = (s+1)*2                 # From 4 to 22 by 4's
#---------------------------
module Sequences                   # Begin a new module
  def self.fromtoby(from, to, by)  # A singleton method of the module
    x = from
    while x <= to
      yield x
      x += by
    end
  end
end
#---------------------------
Sequences.fromtoby(1, 10, 2) {|x| print x }  # Prints "13579"
#---------------------------
class Range                  # Open an existing class for additions
  def by(step)               # Define an iterator named by
    x = self.begin           # Start at one endpoint of the range
    if exclude_end?          # For ... ranges that exclude the end
      while x < self.end     # Test with the < operator
        yield x
        x += step
      end
    else                     # Otherwise, for .. ranges that include the end
      while x <= self.end    # Test with <= operator
        yield x
        x += step
      end
    end
  end                        # End of method definition
end                          # End of class modification

# Examples
(0..10).by(2) {|x| print x}  # Prints "0246810"
puts
(0...10).by(2) {|x| print x} # Prints "02468"

puts
