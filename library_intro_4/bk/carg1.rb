#!/usr/bin/env ruby
   require 'optparse'

   options = {}
   OptionParser.new do |opts|
     opts.banner = "Usage: example.rb [- v ]"

     opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
       options[:verbose] = v
     end
#   end.parse!
   end.parse!(ARGV)


#   p options
#   p ARGV

