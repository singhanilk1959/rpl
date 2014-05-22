#!/usr/bin/env ruby
#

trap("SIGUSR1") { puts "hello"  }
 
puts $$
pid=$$ ; puts pid 
Process.kill("SIGUSR1", $$)
sleep 60

