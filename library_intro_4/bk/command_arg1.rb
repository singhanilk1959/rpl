#!/usr/bin/env ruby
#Example command line:
#
#   ARGF is concatenation of all files 
#


STDOUT << ARGF.argv << "\n"

ARGF.lines do |line|
     puts ARGF.filename if ARGF.lineno == 1
     puts "#{ARGF.lineno}: #{line}"
     puts ARGF.filename if ARGF.eof?
   end

STDOUT << ARGF.argv

