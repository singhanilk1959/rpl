#!/usr/bin/env ruby
# 
#*******************
#out = `cat  sh10.rb` ; puts out ;
puts %^
out = `ruby  -e ' puts Module.constants.sort.reject{|x| eval(x.to_s).is_a? Module}' `
^
puts "Press Enter: " 
gets
out = `ruby  -e ' puts Module.constants.sort.reject{|x| eval(x.to_s).is_a? Module}' `
print out


#******************

