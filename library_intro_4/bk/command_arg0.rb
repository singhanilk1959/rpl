#!/usr/bin/env ruby
#Example command line:
#
#   hello -n 6 --name -- /tmp
#

puts "Program name: #{$0}"
puts "Program name:",$0
p $0
$> << $0 << "\n"
STDOUT << $0 << $\

o= STDOUT
i= STDIN
el = $\

o << ARGV

o << ARGF.argv

inp = gets 
$> << inp  

