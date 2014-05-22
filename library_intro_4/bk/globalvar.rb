#!/usr/bin/env ruby
# you can obtain the complete list of global variables predefined by Ruby
# ruby -e 'puts global_variables.sort '
# To include verbose names

# $0  program name
# $* command line options
# $< $stdin or concatenation of all files
# $> $stdout
#
# $/ input record separator
# $\ output record separator
# $; input Field Separator
# $, Output field Separator
#
# $! Exception
# $@ Stack backtrace
#
# $$ process number
# $? process exit status
#
# Special Global Expression variables
# Global    English       	Alternative
#  $~       $LAST_MATCH_INFO	Regexp.last_match
#  $&       $MATCH		Regexp.last_match[0]
#  $`       $PREMATCH		Regexp.last_match.pre_match
#  $'       $POSTMATCH          Regexp.last_match.post_match
#  $1	    -			Regexp.last_match[1]
#  $2,etc	    -		Regexp.last_match[2]
#  $+	    -			Last_paren_match
puts "***************Global Variables************************"
gv =` ruby  -e 'puts global_variables.sort' `
print gv
puts "***************Global Variables************************"
gv =` ruby -rEnglish -e 'puts global_variables.sort' `

#print "Global Variables"

print gv



require "English"

print $ARGV

print $0, $1, $2
print $FS ; print $;
