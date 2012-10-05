#!/usr/bin/ruby

out=`cat exaks.rb` ; puts out ; print "Press Enter:" ; out1=gets ;

out = gets
out = `ruby  -n -e 'print   ' README `
puts out
puts "***********"
out = gets
out = `ruby  -n -e 'print $_' README `
puts out
out = gets
out = `ruby -n -e 'print if /you/ ' README `
puts out
out1 = `ruby -e 'print "hello world" ' `
puts out1 
out = gets
out = %x{ruby -e 'print "hello world1" ' }
puts out


#print `ruby -e 'puts global_variables.sort' `

#print `ruby  -rEnglish -e 'puts global_variables.sort' `

