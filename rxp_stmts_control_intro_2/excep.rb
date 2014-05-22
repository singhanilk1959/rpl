#!/usr/bin/env ruby
#
puts `cat excep.rb `

def factorial(arg)
  raise "Error in factorial"
end

begin                                # Handle exceptions in this block
  x = factorial(-1)                  # Note illegal argument
rescue => ex                         # Store exception in variable ex
  puts "#{ex.class}: #{ex.message}"  # Handle exception by printing message
  puts "Stack Backtrace " # Handle exception by printing message
  puts ex.backtrace
end                                  # End the begin/rescue block


# The Exception Class defines two methods, #message and #backtrace , 
# that returns details about the exception.

