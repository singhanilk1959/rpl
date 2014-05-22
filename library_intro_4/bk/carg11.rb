#!/usr/bin/env ruby
   require 'optparse'

   options = {}
  begin
    opts1 = OptionParser.new do |opts|
     opts.banner = "Usage: example.rb [- v ]"

     opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
       options[:verbose] = v
     end
#   end.parse!
 #  end.parse!(ARGV)
    end
#    opts1.parse!(ARGV) ;
    opts1.parse!

#   rescue Exception => ex
#   rescue StandardError => ex
   rescue RuntimeError => ex
#   rescue OptionParser::ParseError => ex
        puts " I am hereex"
        puts opts1.to_s  
   end


#   p options
#   p ARGV

