#!/usr/bin/env ruby 
# 
#*******************
out = `cat  sh8.rb` ; puts out ;
puts out
puts "Press Enter: " 
gets
out = `ruby -e ' puts global_variables.sort '`
print out
puts "Press Enter: " 
gets
out = `ruby -rEnglish -e ' puts global_variables.sort '`
print out


#******************

