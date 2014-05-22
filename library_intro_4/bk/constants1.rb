#!/usr/bin/env ruby
# you can obtain the complete list of global variables predefined by Ruby
#
print "Global Constants\n"

gc =` ruby -e 'puts Module.constants.sort.reject{|x| eval(x.to_s).is_a? Module}' `
print gc

puts "ARGV #{ARGV}", ARGV


