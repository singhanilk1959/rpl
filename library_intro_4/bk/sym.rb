#!/usr/bin/env ruby
#
# A Symbol Object refers to a symbol. A symbol literal is written by prefixing an identifier or string with colon.
#
# In 1.9, the Symbol Class defines a number of string methods and allows it to be used as an immutable string ( also non-garbage collected ).

puts  ; print "Press Enter:" ; out1=gets ;
puts %q?
:symbol                   # A Symbol literal
:"symbol"                 # The same literal
:'another long symbol'    # Quotes are useful for symbols with spaces
s = "string"
sym = :"#{s}"             # The Symbol :string
%s["]     # Same as :'"'
?


:symbol                   # A Symbol literal
:"symbol"                 # The same literal
:'another long symbol'    # Quotes are useful for symbols with spaces
s = "string"
sym = :"#{s}"             # The Symbol :string
%s["]     # Same as :'"'

 puts ; print "Press Enter:" ; out1=gets ;
puts %q?
str = "String"     # Begin with a string
sym = str.intern   # Convert to a symbol
sym = str.to_sym   # Another way to do the same thing
str = sym.to_s     # Convert back to a string
str = sym.id2name  # Another way to do it
?

str = "String"     # Begin with a string
sym = str.intern   # Convert to a symbol
sym = str.to_sym   # Another way to do the same thing
str = sym.to_s     # Convert back to a string
str = sym.id2name  # Another way to do it

# String methods implemented in Symbol
puts "String methods implemented in Symbol: "; print "Press Enter:" ; out1=gets ;

print 'sym.to_s : ', sym.to_s 			; puts
print 'sym.length : ',  sym.length		; puts
print 'sym.upcase : ',  sym.upcase		; puts
print 'sym.swapcase : ', sym.swapcase		; puts
print 'sym.downcase : ', sym.downcase		; puts
print ':string.capitalize: ', :string.capitalize		; puts
puts 'sym.match(/S.*/) : ', sym.match(/S.*/) 


__END__
---------------------------
:symbol                   # A Symbol literal
:"symbol"                 # The same literal
:'another long symbol'    # Quotes are useful for symbols with spaces
s = "string"
sym = :"#{s}"             # The Symbol :string
---------------------------
%s["]     # Same as :'"'
---------------------------
o.respond_to? :each
---------------------------
name = :size
if o.respond_to? name
  o.send(name)
end
---------------------------
str = "string"     # Begin with a string
sym = str.intern   # Convert to a symbol
sym = str.to_sym   # Another way to do the same thing
str = sym.to_s     # Convert back to a string
str = sym.id2name  # Another way to do it
