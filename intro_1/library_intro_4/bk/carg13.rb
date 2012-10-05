#!/usr/bin/env ruby
   require 'optparse'

   options = {}
  begin
    opts1 = OptionParser.new do |opts|
     opts.banner = "Usage: example.rb [- v ]"

     opts.on("-x") ;
     opts.on("-f Filename") ;
     opts.on ("-F [Filename] ") ;
     opts.on ("-g=ARG") ;
     opts.on ("-g=ARG") ;
     opts.on ("-G[=ARG1]") ;
     opts.on ("-H [=ARG1]") ;
     opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
       options[:verbose] = v
     end
    end

    opts1.parse!

   rescue Exception => ex
        puts " I am hereex"
        puts opts1  
   end


   p options
   p ARGV

