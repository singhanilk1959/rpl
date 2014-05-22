#!/usr/bin/env ruby
puts %q^

   Top level methods are instance methods of Object (even though self is not Object).
   Top levels methods are always private. 

    
   Top level methods, being instance methods of Object, are inherited by all Classes including
   Module and Class. They can be used anywhere either in instance or class methods.

   Top levels being private must be invoked like functions without an explicit receiver.
   In this way, Ruby mimics procedure programming paradigm within its strictly Object Oriented framework.

^
gets
out=`cat self.rb` ; puts out ; print "Press Enter:" ; out1=gets ;
#************************

puts "Top level Self is #{self} and its class is #{self.class}"

class C
	puts "Just after Class C: Class level Self is #{self} and its class is #{self.class}"

   def self.x 	# A Class method , could be defined as C.x 
	puts "Class Method level Self is #{self} and its class is #{self.class}"
   end

   def m
	puts "Instance Method level Self is #{self} and its class is #{self.class}"
   end

	puts "Class1 level Self is #{self} and its class is #{self.class}"

end


C.x

C.new.m

#************************

puts ""

gets

