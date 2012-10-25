#!/usr/bin/env ruby
# Tempfile usage
#
require 'tempfile'

tf = Tempfile.new("afile") ;
p tf.path

tf <<" First Line\n"
tf <<" second line"

tf.rewind

tf.each do |line|
   STDOUT <<  line
end
 STDOUT << "\n"

tf.close
tf.open

tf.each do |line|
   STDOUT <<  line
end
 STDOUT << "\n"

# tf.close!  # theis closes and purges the data
# tf.unlink

# You do not need to close and delete (unlink) the file if it is not a server or# very long running process i.e like a deamon...on exit all the tempfiles get 
# close anyway


require "tmpdir"

p Dir.tmpdir
