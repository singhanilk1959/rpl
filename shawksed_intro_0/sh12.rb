#!/usr/bin/env ruby
#
#******************
out = `cat  sh12.rb` ; puts out ;

puts ARGV 

require "trollop"

  opts = Trollop::options do
    opt :monkey, "Use monkey mode"             # flag --monkey, default false
    opt :name, "Monkey name", :type => :string  # string --name <s>, default nil
    opt :num_limbs, "Number of limbs", :default => 4 
					# integer --num-limbs <i>, default to 4
  end

  p opts # a hash: { :monkey=>false, :name=>nil, :num_limbs=>4, :help=>false }a
puts %^
^
puts "Press Enter: " 
#*****************
