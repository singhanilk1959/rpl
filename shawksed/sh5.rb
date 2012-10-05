#!/usr/bin/env ruby
# 
#*******************
#out = `cat  sh4.rb` ; puts out ;
puts %^
out = `ruby -n -e ' print $_ ;  $_.gsub!(/are|This/,"ARE"); print $_' README1 `
^
puts "Press Enter: " 
gets
out = `ruby -n -e ' print $_ ;  $_.gsub!(/are|This/,"ARE"); print $_' README1 `
print out

puts %^
out = `ruby -ibak -n -e ' print $_ ;  $_.gsub!(/are|This/,"ARE"); print $_' README1 `
^
puts "Press Enter: " 
gets
out = `ruby -ibak -n -e ' print $_ ;  $_.gsub!(/are|This/,"ARE"); print $_' README1 `
print out
out1 = `diff README1.bak README1`
out2 = `cat README1`

puts out1
puts  out2

#******************

