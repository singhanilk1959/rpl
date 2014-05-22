#!/usr/bin/env ruby
#
#******************
out = `cat  sh15.rb` ; puts out ;
require "trollop"

require 'trollop'
p = Trollop::Parser.new do
  opt :monkey, "Use monkey mode"                     # a flag --monkey, defaulting to false
  opt :goat, "Use goat mode", :default => true       # a flag --goat, defaulting to true
end

opts = Trollop::with_standard_exception_handling p do
  raise Trollop::HelpNeeded if ARGV.empty? # show help screen
  p.parse ARGV
end


