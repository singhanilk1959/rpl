#!/usr/bin/env ruby
#
###from command line
#ruby -e 'puts Module.constants.sort.reject{|x| eval(x.to_s).is_a? Module}'
puts `cat constants_ruby.rb` 

gets ; 


puts Module.constants.sort.reject{|x| eval(x.to_s).is_a? Module}

puts ; gets





puts %^
ARGF              	IO object providing access to a virtual concatenation of files named in ARGV or std input
ARGV			A synonym for $*, An array containing the arguments specified on the caommand line
CROSS_COMPILING
ENV			An object that behaves like hash and provides access to Environment variables
FALSE			A deprecated synonym for true false
NIL			A deprecated synonym for true nil
RUBYGEMS_ACTIVATION_MONITOR
RUBY_COPYRIGHT
RUBY_DESCRIPTION
RUBY_ENGINE
RUBY_PATCHLEVEL
RUBY_PLATFORM
RUBY_RELEASE_DATE
RUBY_REVISION
RUBY_VERSION

STDERR                  Standard error stream: The default value of $stderr
STDIN			Standard Input Stream: Thedefault value of $stdin			
STDOUT                  Standard Output Stream: The default value of $output 

TOPLEVEL_BINDING
TRUE			A deprecated synonym for true

^



