#!/usr/bin/env ruby
# 
#*******************
out = `cat  sh4.rb` ; puts out ;
out = `ruby -p -e ' print $_ ; $_="" ' README1 `
puts "Press Enter: " 
gets
print out

#******************

