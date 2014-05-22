#!/usr/bin/env ruby
# run it as File_ex0.rb *.rb or 
puts `cat File_ex0.rb`
puts "Program Name:", $0
puts "command line file names", $*
puts "**************"

while line = gets
  puts line
end

puts "**************"


