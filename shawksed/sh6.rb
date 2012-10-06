#!/usr/bin/env ruby
# 
#*******************
#out = `cat  sh6.rb` ; puts out ;
`cp README README1`
puts %^
out = `ruby -a -n -e '  puts $_  , $F[0], $F[1] ' README1 `
^
puts "Press Enter: " 
gets
out = `ruby -a -n -e '  puts $_  , $F[0], $F[1] ' README1 `
print out


#******************

