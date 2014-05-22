#!/usr/bin/env ruby
   require 'optparse'

   options = {}
  begin
    opts1 = OptionParser.new do |opts|
     opts.banner = "Usage: example.rb [- v ]"

     opts.on("-x" );
     opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
       options[:verbose] = v
     end
    end

    opts1.parse!

   rescue Exception => ex
        puts " I am hereex"
        puts opts1.to_s  
   end


   p options
   p ARGV

