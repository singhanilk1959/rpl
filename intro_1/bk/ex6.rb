#!/usr/bin/ruby

out=`cat ex6.rb` ; puts out ; print "Press Enter:" ; out1=gets ;

# -n is like a loop across the script to work on complete file

######################################

out = `ruby -n -e 'print if /you/ ' README `
print out

######################################
