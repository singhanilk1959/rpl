#!/usr/bin/env ruby
#Example command line:
#
#   hello -n 6 --name -- /tmp
#
 require 'getoptlong'

	 print "WORLD"
  opts = GetoptLong.new(
    [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
    [ '--repeat', '-n', GetoptLong::REQUIRED_ARGUMENT ],
    [ '--name', GetoptLong::OPTIONAL_ARGUMENT ]
  ) 
#  rescue Exception => ex
#	 print ex 
	 print "HELLO WORLD"
          exit 0

