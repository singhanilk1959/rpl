#!/usr/bin/env ruby
#
#####to execute from shell i.e commandline.####### 
#ruby -e 'puts global_variables.sort'
#ruby -rEnglish -e 'puts global_variables.sort'
########################################
#puts `cat gvars_ruby.rb`

puts ; gets
puts %^
gets
puts global_variables.sort
gets
require "English"
puts global_variables.sort
^

gets
puts global_variables.sort
gets
require "English"
puts global_variables.sort

puts ; gets
puts %^
***Global Settings**************
$* $ARGV
$? $CHILD_STATUS
$$ $PID $PROCESS_ID

***Exception Handling Globals****

$! $ERROR_INFO		The last exception raised
$@ $ERROR_POSITION      The stack trace of last exception = $!.backtrace
***Streams*******************

$< $DEFAULT_INPUT  ARGF : access to a virtual concatenation of the files specified on the command line
$> $DEFAULT_OUTPUT $stdout STDOUT : standard output stream, Kernel: puts, printf, print etc

$stderr STDERR  $stderr is initially set to constant STDERR
$stdin  STDIN   $stdin is initially set to STDIN
$stdout STDOUT  $stdin is initially set to STDOUT

^
puts ; gets
puts %^
***Text Processing globals*******

$_ $LAST_READ_LINE
$. $NR $INPUT_LINE_NUMBER
$F it holds the fields of current line if invoked with -a and -n or -p option
$; $FS $INPUT_FIELD_SEPARATOR
$, $OFS $OUTPUT_FIELD_SEPARATOR
$/ $RS  $INPUT_RECORD_SEPARATOR
$\ $ORS $OUTPUT_RECORD_SEPARATOR

***Pattern Matching Globals

$~ $MATCH_INFO  The MatchData Object produced by the last matching pattern
$& $MATCH       The most recently matched text
$` $PREMATCH
$' $POSTMATCH
$+ $LAST_PAREN_MATCH

^
puts ; gets
puts %^
***Command line option Globals

$-a
$-i
$-l
$-p
$-W $-v $-w
$0 $PROGRAM_NAME

***
^
puts ; gets
puts %^
^

