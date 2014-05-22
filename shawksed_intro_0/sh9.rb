#!/usr/bin/env ruby
# 
#*******************
#out = `cat  sh9.rb` ; puts out ;
puts %^
`cp README README1`
out = `ruby -a -n -e '   print $. , ":", $_ ,  "\n" if /the/ ' README1 `
^
puts "Press Enter: " 
gets
`cp README README1`
out = `ruby -a -n -e '   print $. , ":", $_ ,  "\n" if /the/ ' README1 `
print out


#******************

