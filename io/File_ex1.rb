#!/usr/bin/env ruby
puts `cat File_ex1.rb`

`find . -name '*.rb'`.split("\n").each do |filename|
  puts filename
#  handle = File.open(filename,"w+")
#  handle.write(handle.read.encode('UTF-8'))
#  handle.close
end

