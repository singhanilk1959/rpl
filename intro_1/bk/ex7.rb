#!/usr/bin/ruby

# -a splits the line into different fields in $F Array, $_ is the global variable that has the read line

out=`cat ex7.rb` ; puts out ; print  "Press Enter:"; out1=gets ;

###################################
out = `ruby -n   -a  -e 'print $F[0]," ", $_ if /you/ ' README `
out1 = `ruby -n   -a  -e 'print $F[0] ,  " " if /you/ ' README `
out2 = `ruby -n -l  -a  -e 'print $F[0] ,  " " if /you/ ' README `

print out
puts "********************************************** "
print out1
puts "********************************************** "
print out2

###################################
