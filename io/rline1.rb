#!/usr/bin/env ruby
#

out=`cat rline1.rb` ; puts out

require 'readline'

#
while line = Readline.readline('>',true) do
   puts line
end
#

