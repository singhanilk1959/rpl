#!/usr/bin/env ruby

rs = "hello world".tap {|x| puts "original object: #{x.inspect}"}
  .each_char         .tap {|x| puts "each_char returns: #{x.inspect}"}
  .to_a              .tap {|x| puts "to_a returns: #{x.inspect}"}
  .map {|c| c.succ } .tap {|x| puts "map returns: #{x.inspect}" }
  .sort 
