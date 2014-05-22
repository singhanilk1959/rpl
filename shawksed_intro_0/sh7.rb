#!/usr/bin/env ruby
# 
#*******************
#out = `cat  sh6.rb` ; puts out ;
`cp README README1`
puts %^
out = `ruby -a -n -e '  print $.,": "  ; print $F[0],",", $F[1], "\n" ' README1 `
^
puts "Press Enter: " 
gets
out = `ruby -a -n -e '   print $.,": "  ; print $F[0],",", $F[1] , "\n" ' README1 `
print out


#******************

