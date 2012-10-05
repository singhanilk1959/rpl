#!/usr/bin/env ruby
# 
#*******************
out = `cat  sh3.rb` ; puts out ;
out = `ruby -p -e ' print $_' README1 `
puts "Press Enter: " 
gets
print out

#******************

