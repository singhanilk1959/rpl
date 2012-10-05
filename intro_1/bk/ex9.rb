#!/usr/bin/ruby 
# please execute it from command line
# -C dir or -X dir changes the dir to dir and than executes the program

out=`cat ex9.rb` ; puts out ; print "Press Enter:";   out1=gets ;
######################################
hello = `pwd`
hello1= `cp ex1.rb /tmp`
hello2= `ruby -C /tmp ex1.rb `

puts hello2
puts  hello
######################################




