#!/usr/bin/env ruby
#Example command line:
#
#   ARGF is concatenation of all files 
#
# ARGF.each_byte
# ARGF_bytes
# ARGF.each_char
# ARGF.chars
# ARGF.each_line
# ARGF.lines


STDOUT << ARGF.argv << "\n"


ARGF.chars { |c| print c }
__END__
ARGF.each_char { |c| puts c }
ARGF.bytes { |c| p c }
ARGF.each_byte { |c| p c }

ARGF.chars do |c|
     puts ARGF.filename if ARGF.lineno == 1
     print c 
     puts ARGF.filename if ARGF.eof?
   end

STDOUT << ARGF.argv

