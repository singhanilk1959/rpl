#!/usr/bin/env ruby
# 
#*******************
#out = `cat  sh10.rb` ; puts out ;
puts %^
puts " Run as sh10.rb -v -k file1 file2"
puts "Press Enter: " 
puts ARGV
puts ARGV[0]
puts $*[1]
^
puts "Press Enter: " 
puts ARGV
puts "***********"
puts ARGV[0]
puts "***********"
puts $*[1]



#******************

