#!/usr/bin/env ruby
#
def factorial(arg)
  raise "Error in factorial"
end

begin                                # Handle exceptions in this block
  x = factorial(-1)                  # Note illegal argument
rescue => ex                         # Store exception in variable ex
  puts "#{ex.class}: #{ex.message}"  # Handle exception by printing message
end                                  # End the begin/rescue block

