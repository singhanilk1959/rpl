#!/usr/bin/ruby

out=`cat ex5.rb` ; puts out ; print "Press Enter:" ; out1=gets ;
# -e excutes the one line script
################################

out = `ruby  -e 'print "hello world \n" ; puts "I am here" ' `
print out

################################
