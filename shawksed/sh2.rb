#!/usr/bin/env ruby
# 
#*******************
out = `cat  sh2.rb` ; puts out ;
out = `ruby -n -e ' print $_' README1 `
puts "Press Enter: " 
gets
print out

#******************

