#!/usr/bin/env ruby
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

