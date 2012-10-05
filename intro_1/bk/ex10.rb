#!/usr/bin/ruby 
# please execute it from command line
#

out=`cat ex10.rb` ; puts out ; print "Press Enter:" ; out1=gets ;
####

hello = `pwd`
hello1= `cp READMEX README1`
hello2= `ruby -i.bak -p -n -e  'gsub("reading","read2") ; gsub("the","the2")'  README1   `
hello2= `ruby   -n -e  ' print if /read2/ ' README1   `

print hello2,"\n"

#########
# -i[ext] does inline editing of the file i.e after editing the output is written back to the samefile. [ext] optionally 
#         backsup the file with that extension before writing to the file
# -n a do loop 
# -p print the line
#
# while gets
#   $F = split if $-a
#      chops if $-l
#      #program text here
#      print if $-p  # Outout $_ (adding $\ if -l was specified)
# end




 

