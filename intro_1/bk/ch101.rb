#!/usr/bin/ruby
# it just checks the syntax of the ruby program
#require 'English.rb'

out=`cat ch101.rb` ; puts out ; print "Press Enter:" ; out1=gets ;
out=`ruby -e "puts global_variables.sort"` ; puts out ; print "Press Enter:" ; out1=gets ;


#require 'English.rb'
# Above line should be used in a file if English names has to be used

out=`ruby -rEnglish  -e "puts global_variables.sort"` ; puts out ; print "Press Enter:" ; out1=gets ;



