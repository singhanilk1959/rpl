#!/usr/bin/ruby


out=`cat ex3.rb` ; puts out ; print "Press Enter:" ; out1=gets ;

#comment line
###################################
print `ruby -h `  # comment 

###################################
# multiline comments, known as embedded doument, 
# can begin with =begin and end with =end.
# it is typical to follow =begin with an identifier that indicates
#  which tool the comment is intended for eg. =begin rdoc

=begin
Usage: ruby [switches] [--] [programfile] [arguments]
  -0[octal]       specify record separator (\0, if no argument)
  -a              autosplit mode with -n or -p (splits $_ into $F)
  -c              check syntax only
  -Cdirectory     cd to directory, before executing your script
  -d              set debugging flags (set $DEBUG to true)
  -e 'command'    one line of script. Several -e's allowed. Omit [programfile]
  -Eex[:in]       specify the default external and internal character encodings
  -Fpattern       split() pattern for autosplit (-a)
  -i[extension]   edit ARGV files in place (make backup if extension supplied)
  -Idirectory     specify $LOAD_PATH directory (may be used more than once)
  -l              enable line ending processing
  -n              assume 'while gets(); ... end' loop around your script
  -p              assume loop like -n but print line also like sed
  -rlibrary       require the library, before executing your script
  -s              enable some switch parsing for switches after script name
  -S              look for the script using PATH environment variable
  -T[level=1]     turn on tainting checks
  -v              print version number, then turn on verbose mode
  -w              turn warnings on for your script
  -W[level=2]     set warning level; 0=silence, 1=medium, 2=verbose
  -x[directory]   strip off text before #!ruby line and perhaps cd to directory
  --copyright     print the copyright
  --version       print the version



=end
