#!/usr/bin/env ruby

`find . -name '*.rb'`.split("\n").each do |filename|
  puts filename
#  handle = File.open(filename,"w+")
#  handle.write(handle.read.encode('UTF-8'))
#  handle.close
end

