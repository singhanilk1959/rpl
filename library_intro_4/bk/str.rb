#!/usr/bin/env ruby
#
# Ruby gives you two  built-in classes that, between them, provide all the 
# functionality of the text: String and Symbol class.
# String are mutable objects.  
# A single-quoted string behaves differently than double quoted strings:
#   1. The string interpolation does not work with single-quoted strings.
#   

el = "\n"
puts "String  World"
puts "" ; line = gets  

puts "\"Double Quoted String\" vs 'Single quoted string'"
puts "" 
puts "" 
puts ' The string interpolation #{$0}  #{puts "hello world" } does not work with single-quoted strings. '
puts "" 
puts " The string interpolation #{$0}  #{puts "hello world" } does work with double-quoted strings. "

puts "hello world", "#{puts "hi"} "
puts "" 
puts ""
puts "********************"
puts "" ; line = gets ; 
puts '%q allows you to define your own single quote delimiters'
puts '%Q or just % allows you to define your own double quote delimiters'

puts "" ; line = gets ; 
puts "" 
puts 'puts %q( Hello world )'
puts %q( Hello world )

puts "" ; line = gets ; 
puts ""
puts 'puts %Q[ Hello world ]'
puts %Q[ Hello world ]


puts "" ; line = gets ; 
puts ""
puts 'puts %- Hello worldQ #{$0} -'
puts %- Hello worldQ #{$0} -

puts ""
puts "********************"
puts "" ; line = gets ; 
STDOUT << "writing on STDOUT\n" << "next line\n"

puts 'chop strips the last character, returns a new string'
puts 'chop! strips the last character in place,returns nil if nothing changed'
puts ""
puts "********************"
puts %-
s = "hello \n"      # A string with a line terminator
print s
print s.chop
print s.chop
print s.chop!
print s.chop!
print s.chop!
print s.chop!
print s.chop!
print s.chop!
print " returns nil as there is nothing to be chopped", s.chop!
-
puts ""
puts "********************"
s = "hello \n"      # A string with a line terminator
print s
print s.chop
print s.chop
print s.chop!
print s.chop!
print s.chop!
print s.chop!
print s.chop!
print s.chop!
print " returns nil as there is nothing to be chopped", s.chop!
puts "" ; line = gets ; 
puts ""
puts "********************"
line=gets
puts 'chomp strips the last newline if present, returns a new string'
puts 'chomp! strips the last newline character in place, returns nil if nothing changed'
puts 'chomp!(\'c\') strips the last \'c\' character in place, returns nil if nothing changed'
s = "hello1 \n\n"      # A strig with a line terminator
print s 
print s.chomp
print s.chomp!
print s.chomp!
print " returns nil as no  trailing whitespace to be removed s.chomp! ", s.chomp!, "\n"
print " returns string as no  trailing whitespace to be removed s.chomp ", s.chomp, "\n"
print "remove the last blank s.chomp!(' ') ",s.chomp!(' ')
print "chomps the last 1 s.chomp!('1')  ", s.chomp!('1')
print " returns nil as no whitespace to be removed s.chomp! ", s.chomp!
puts "" ; line = gets ; 

puts ""
puts "********************"
puts %-
# Strip all whitespace (including \t, \r, \n) from left, right, or both
# strip!, lstrip! and rstrip! modify the string in place.
s = "\t hello \n"   # Whitespace at beginning and end
s.strip             # => "hello"
s.lstrip            # => "hello \n"
s.rstrip            # => "\t hello"
-
puts ""
puts "********************"
puts ""
s = "\t hello \n"   # Whitespace at beginning and end
puts s
puts s.strip             # => "hello"
puts s.lstrip            # => "hello \n"
puts s.rstrip            # => "\t hello"

puts ""
puts %q?
*************************
# Left-justify, right-justify, or center a string in a field n-characters wide.
# There are no mutator versions of these methods. See also printf method.
s = "x"
s.ljust(3)          # => "x  "
s.rjust(3)          # => "  x"
s.center(3)         # => " x "
s.center(5, '-')    # => "--x--": padding other than space are allowed
s.center(7, '-=')   # => "-=-x-=-": multicharacter padding allowed
*************************
?
puts ""
s = "x"
puts s.ljust(3)          # => "x  "
puts s.rjust(3)          # => "  x"
puts s.center(3)         # => " x "
puts s.center(5, '-')    # => "--x--": padding other than space are allowed
puts s.center(7, '-=')   # => "-=-x-=-": multicharacter padding allowed

puts ""
puts "********************"
puts "" ; line = gets ; 
s = "hello world: "      # 
puts s 

print %-"s.count(["str"]+) : count the intersection of string \n"-
puts "" ; line = gets ; 
puts %-s.count("l") : - 
print s, s.count("l"),"\n" 
puts %-s.count("o") : - 
print s, s.count("o"),"\n" 
puts %-s.count("o","l") : count nil as no intersection between o and l - 
print s, s.count("o" ,"l"),"\n" 
puts %-s.count("o","l","h") : - 
print s, s.count("o" ,"l","h"),"\n" 
puts %-s.count("ol","le","lh") : count l as that is the intersection here : - 
print s, s.count("ol" ,"le","lh"),"\n" 
puts %-s.count("ol","l") : - 
print s, s.count("ol" ,"l"),"\n" 
puts %-s.count("ol","^l") : - 
print s, s.count("ol" ,"^l"),"\n" 
puts %$s.count("a-z","^lo") :  count lowercase alphabets except lo :$ 
print s, s.count("a-z" ,"^lo"),"\n" 
puts %$s.count("a-z","^aeiou") :  count lowercase constants :$ 
print s, s.count("a-z" ,"^aeiou"),"\n" 

puts ""
puts "********************"
puts "" ; line = gets ; 


print %-"s.delete(["str"]+) : delete the intersection of string \n"-
print %-"s.delete!(["str"]+) : delete the intersection of string \n"-
s = "hello world: "      # 
puts s, %q-s.delete('aeiou')-
puts s.delete('aeiou') # =>  delete lowercase vowels. 
puts s, %q-s.delete('aeiou','ao')-
puts s.delete('aeiou','ao') # => " delete lowercase ao vowels. 
puts s 
puts s, %q-s.delete('ho')-
puts s.delete('ho') # => " delete lowercase ao vowels. 
puts s 
puts s, %q-s.delete!('aeiou','ao')-
puts s.delete!('aeiou') # => delete lowercase vowels.
puts s

puts "" ; line = gets ; 
puts ""
puts "********************"
puts %-"s.squeeze(["str"]*) : squeeze the run of chars to a single char"-
puts %q["hello".squeeze ]  # => "helo": remove runs of letters. Also squeeze!
puts "hello".squeeze  # => "helo": remove runs of letters. Also squeeze!
puts %q["hello".squeeze('a-z')]  # => "helo": remove runs of letters. Also squeeze!
puts "hello".squeeze('a-z')  # => "helo": remove runs of letters. Also squeeze!
puts %q["hello".squeeze('l')]  # => "helo": remove runs of letters. Also squeeze!
puts "hello".squeeze('l')  # => "helo": remove runs of letters. Also squeeze!
puts %q["helloo".squeeze('eo','lo')]  # => "helo": remove runs of letters. Also squeeze!
puts "helloo".squeeze('eo','lo')  # => "helo": remove runs of letters. Also squeeze!

puts "" ; line = gets ; 
puts ""
puts "********************"
puts s, %q-s.delete!('aeiou','ao')-
puts s.delete!('aeiou') # => delete lowercase vowels.
puts s

puts "" ; line = gets ; 
puts ""
puts "********************"
puts %-"s.squeeze(["str"]*) : squeeze the run of chars to a single char"-
puts %q["hello".squeeze ]  # => "helo": remove runs of letters. Also squeeze!
puts "hello".squeeze  # => "helo": remove runs of letters. Also squeeze!
puts %q["hello".squeeze('a-z')]  # => "helo": remove runs of letters. Also squeeze!
puts "hello".squeeze('a-z')  # => "helo": remove runs of letters. Also squeeze!
puts %q["hello".squeeze('l')]  # => "helo": remove runs of letters. Also squeeze!
puts "hello".squeeze('l')  # => "helo": remove runs of letters. Also squeeze!
puts %q["helloo".squeeze('eo','lo')]  # => "helo": remove runs of letters. Also squeeze!
puts "helloo".squeeze('eo','lo')  # => "helo": remove runs of letters. Also squeeze!

puts "" ; line = gets ; 
puts ""
puts "********************"
s="hello"
puts 's,s.length,s.size,s.bytesize'
puts s,s.length,s.size,s.bytesize

puts "" ; line = gets ; 
puts 's,s.concat, s1 << s2'
puts %-
***********************
s="hello"
puts s
puts s + "world"
puts s.concat("WORLD")
puts s.concat( "world" )
puts s << "World"
puts s
***********************
-
puts ""

s="hello"
puts s
puts s + "world"
puts s.concat("WORLD")
puts s.concat( "world" )
puts s << "World"
puts s

# Case modification methods
puts "" ; line = gets ; 
puts ""
puts "********************"
eol="\n"
s = "world"   # These methods work with ASCII characters only
print s, ' s.upcase ',s.upcase,"\n"      # => "WORLD"
print s, ' s.upcase! ',s.upcase!,eol      # => "WORLD"
print s, ' s.downcase ',s.downcase,eol      # => "WORLD"
print s, ' s.downcase! ',s.downcase!,eol      # => "WORLD"
print s, ' s.capatalize ',s.capitalize  ,eol    # => "WORLD"
print s, ' s.capatalize! ',s.capitalize! ,eol     # => "WORLD"
print s, ' s.swapcase ',s.swapcase ,eol     # => "WORLD"
print s, ' s.swapcase! ',s.swapcase! ,eol     # => "WORLD"

puts ""
puts "********************"
puts "" ;
puts ' Checking for prefixes and suffixes: Ruby 1.9 and later'
line = gets ; 
s="hello"
puts s
# Checking for prefixes and suffixes: Ruby 1.9 and later
puts %q-s.start_with? "hell" # => true.  Note singular "start" not "starts"-
puts s.start_with? "hell" # => true.  Note singular "start" not "starts"-
puts %q-s.start_with? "bell" # => true.  Note singular "start" not "starts"-
puts s.start_with? "bell" # => true.  Note singular "start" not "starts"-
puts %q-s.end? "bell" # => true.  Note singular "start" not "starts"-
puts s.end_with? "bell" # => true.  Note singular "start" not "starts"-
puts %q-s.end? "llo" # => true.  Note singular "start" not "starts"-
puts s.end_with? "llo" # => true.  Note singular "start" not "starts"-

puts "" ;
puts ""
puts "********************"
puts ' Testing for presence of substring ';  line = gets ; 
puts %q-s.include?("ll")     # => true: "hello" includes "ll" -
puts s.include?("ll")     # => true: "hello" includes "ll"
puts %q-s.include?(?H)       # => false: "hello" does not include character H-
puts s.include?(?H)       # => false: "hello" does not include character H

puts %-s =~ /[aeiou]{2}/     # => nil: no double vowels in "hello" -
puts s =~ /[aeiou]{2}/    # => nil: no double vowels in "hello"
puts %-s.match(/[aeiou]/) {|m| m.to_s}  # => "e": return first vowel -
puts s.match(/[aeiou]/) {|m| m.to_s}  # => "e": return first vowel

puts ""
puts "********************"
puts ;line = gets ; 

# Splitting a string into substrings based on a delimiter string or pattern
print %-
********************
"this is it".split     # => ["this", "is", "it"]: split on spaces by default
"hello".split('l')     # => ["he", "", "o"]
"1, 2,3".split(/,\s*/) # => ["1","2","3"]: comma and optional space delimiter
********************
-
print "this is it".split ,el    # => ["this", "is", "it"]: split on spaces by default
print "hello".split('l'),el     # => ["he", "", "o"]
print "1, 2,3".split(/,\s*/),el # => ["1","2","3"]: comma and optional space delimiter

puts ;line = gets ; 

puts %q-
********************
# Split a string into two parts plus a delimiter. Ruby 1.9 only.
# These methods always return arrays of 3 strings:
"banana".partition("an")  # => ["b", "an", "ana"] 
"banana".rpartition("an") # => ["ban", "an", "a"]: start from right
"a123b".partition(/\d+/)  # => ["a", "123", "b"]: works with Regexps, too
********************
-
# Split a string into two parts plus a delimiter. Ruby 1.9 only.
# These methods always return arrays of 3 strings:

print "banana".partition("an") , el  # => ["b", "an", "ana"] 
print "banana".rpartition("an") , el # => ["ban", "an", "a"]: start from right
print "a123b".partition(/\d+/) , el  # => ["a", "123", "b"]: works with Regexps, too

print %-
********************
# Search and replace the first (sub, sub!) or all (gsub, gsub!)
# occurrences of the specified string or pattern.
# More about sub and gsub when we cover regular expressions later.
s.sub("l", "L")            # => "heLlo": Just replace first occurrence
s.gsub("l", "L")           # => "heLLo": Replace all occurrences
s.sub!(/(.)(.)/, '\2\1')   # => "ehllo": Match and swap first 2 letters
s.sub!(/(.)(.)/, "\\2\\1") # => "hello": Double backslashes for double quotes

# sub and gsub can also compute a replacement string with a block
# Match the first letter of each word and capitalize it

"hello world".gsub(/\b./) {|match| match.upcase } # => "Hello World"
********************
-
# Search and replace the first (sub, sub!) or all (gsub, gsub!)
# occurrences of the specified string or pattern.
# More about sub and gsub when we cover regular expressions later.
puts s.sub("l", "L")            # => "heLlo": Just replace first occurrence
puts s.gsub("l", "L")           # => "heLLo": Replace all occurrences
puts s.sub!(/(.)(.)/, '\2\1')   # => "ehllo": Match and swap first 2 letters
puts s.sub!(/(.)(.)/, "\\2\\1") # => "hello": Double backslashes for double quotes

# sub and gsub can also compute a replacement string with a block
# Match the first letter of each word and capitalize it
puts "hello world".gsub(/\b./) {|match| match.upcase } # => "Hello World"


puts ;line = gets ; 

puts %q^
********************
s = "A\nB"                       # Three ASCII characters on two lines
s.each_byte {|b| print b, " " }  # Prints "65 10 66 "
s.each_line {|l| print l.chomp}  # Prints "AB"

# Sequentially iterate characters as 1-character strings
# Works in Ruby 1.9, or in 1.8 with the jcode library:
s.each_char { |c| print c, " " } # Prints "A \n B "

# Enumerate each character as a 1-character string
# This does not work for multibyte strings in 1.8
# It works (inefficiently) for multibyte strings in 1.9:
0.upto(s.length-1) {|n| print s[n,1], " "}

# In Ruby 1.9, bytes, lines, and chars are aliases
s.bytes.to_a                     # => [65,10,66]: alias for each_byte
s.lines.to_a                     # => ["A\n","B"]: alias for each_line
s.chars.to_a                     # => ["A", "\n", "B"] alias for each_char
********************
^
s = "A\nB"                       # Three ASCII characters on two lines
s.each_byte {|b| print b, " " }  # Prints "65 10 66 "
puts "\n**"
s.each_line {|l| print l.chomp}  # Prints "AB"
puts "\n**"

# Sequentially iterate characters as 1-character strings
# Works in Ruby 1.9, or in 1.8 with the jcode library:
s.each_char { |c| print c, " " } # Prints "A \n B "
puts "\n**"

# Enumerate each character as a 1-character string
# This does not work for multibyte strings in 1.8
# It works (inefficiently) for multibyte strings in 1.9:
0.upto(s.length-1) {|n| print s[n,1], " "}
puts "\n**"


# In Ruby 1.9, bytes, lines, and chars are aliases
print  s.bytes.to_a ,el                     # => [65,10,66]: alias for each_byte
print s.lines.to_a      ,el                # => ["A\n","B"]: alias for each_line
print s.chars.to_a          ,el            # => ["A", "\n", "B"] alias for each_char

# Translation from one set of characters to another
puts ;line = gets ; 

puts %q^
********************
"hello".tr("aeiou", "AEIOU")  # => "hEllO": capitalize vowels. Also tr!
"hello".tr("aeiou", " ")      # => "h ll ": convert vowels to spaces
"bead".tr_s("aeiou", " ")     # => "b d": convert and remove duplicates

# Checksums
"hello".sum          # => 532: weak 16-bit checksum
"hello".sum(8)       # => 20: 8 bit checksum instead of 16 bit
"hello".crypt("ab")  # => "abl0JrMf6tlhw": one way cryptographic checksum
                     # Pass two alphanumeric characters as "salt"
                     # The result may be platform-dependent
********************
^
puts "hello".tr("aeiou", "AEIOU")  # => "hEllO": capitalize vowels. Also tr!
puts "hello".tr("aeiou", " ")      # => "h ll ": convert vowels to spaces
puts "bead".tr_s("aeiou", " ")     # => "b d": convert and remove duplicates
puts "hello".sum          # => 532: weak 16-bit checksum
puts "hello".sum(8)       # => 20: 8 bit checksum instead of 16 bit
puts "hello".crypt("ab")  # => "abl0JrMf6tlhw": one way cryptographic checksum

puts ;line = gets ; 

puts %q^
*****************************
n, animal = 2, "mice"
"#{n+1} blind #{animal}"  # => '3 blind mice'

# Alternatives to the interpolation above
printf('%d blind %s', n+1, animal)  # Prints '3 blind mice', returns nil
sprintf('%d blind %s', n+1, animal) # => '3 blind mice'
'%d blind %s' % [n+1, animal]  # Use array on right if more than one argument
*****************************
^
n, animal = 2, "mice"
puts "#{n+1} blind #{animal}"  # => '3 blind mice'
printf('%d blind %s ', n+1, animal)  # Prints '3 blind mice', returns nil
puts
puts a=printf('%d blind %s', n+1, animal) # => '3 blind mice'
puts '%d blind %s' % [n+1, animal]  # Use array on right if more than one argument

puts ;line = gets ; 

puts %q^
*****************************
# Formatting numbers
'%d' % 10         # => '10': %d for decimal integers
'%x' % 10         # => 'a': hexadecimal integers
'%X' % 10         # => 'A': uppercase hexadecimal integers
'%o' % 10         # => '12': octal integers
'%f' % 1234.567   # => '1234.567000': full-length floating-point numbers
'%e' % 1234.567   # => '1.234567e+03': force exponential notation
'%E' % 1234.567   # => '1.234567e+03': exponential with uppercase E
'%g' % 1234.567   # => '1234.57': six significant digits
'%g' % 1.23456E12 # => '1.23456e+12': Use %f or %e depending on magnitude
^
puts ;line = gets ; 

puts %q^
# Field width
'%5s' % '<<<'     # '  <<<': right-justify in field five characters wide
'%-5s' % '>>>'    # '>>>  ': left-justify in field five characters wide
'%5d' % 123       # '  123': field is five characters wide
'%05d' % 123      # '00123': pad with zeros in field five characters wide

# Precision
'%.2f' % 123.456  # '123.46': two digits after decimal place
'%.2e' % 123.456  # '1.23e+02': two digits after decimal = three significant digits
'%.6e' % 123.456  # '1.234560e+02': note added zero 
'%.4g' % 123.456  # '123.5': four significant digits

# Field and precision combined
'%6.4g' % 123.456 # ' 123.5': four significant digits in field six chars wide
'%3s' % 'ruby'    # 'ruby': string argument exceeds field width
'%3.3s' % 'ruby'  # 'rub': precision forces truncation of string

^
puts ;line = gets ; 


puts %q^
# Multiple arguments to be formatted
args = ['Syntax Error', 'test.rb', 20]  # An array of arguments
"%s: in '%s' line %d" % args    # => "Syntax Error: in 'test.rb' line 20" 
# Same args, interpolated in different order!  Good for internationalization.
"%2$s:%3$d: %1$s" % args        # => "test.rb:20: Syntax Error"
*****************************
^
__END__

s.end_with? "bells"  # => false
# Finding the position of a substring or pattern match
s.index('l')         # => 2: index of first l in string
s.index(?l)          # => 2: works with character codes as well
s.index(/l+/)        # => 2: works with regular expressions, too
s.index('l',3)       # => 3: index of first l in string at or after position 3
s.index('Ruby')      # => nil: search string not found
s.rindex('l')        # => 3: index of rightmost l in string
s.rindex('l',2)      # => 2: index of rightmost l in string at or before 2
# Testing for presence of substring

# Checking for prefixes and suffixes: Ruby 1.9 and later
#puts %qString are mutable objects. q% 
#puts "\"Double Quoted String\" vs 'Single quoted string'"

__END__

s = "hello"
s.concat(" world")    # Synonym for <<. Mutating append to s. Returns new s.
s.insert(5, " there") # Same as s[5] = " there". Alters s. Returns new s.
s.slice(0,5)          # Same as s[0,5]. Returns a substring.
s.slice!(5,6)         # Deletion. Same as s[5,6]="". Returns deleted substring.
s.eql?("hello world") # True. Same as ==.
---------------------------
s.length         # => 5: counts characters in 1.9, bytes in 1.8
s.size           # => 5: size is a synonym
s.bytesize       # => 5: length in bytes; Ruby 1.9 only
s.empty?         # => false
"".empty?        # => true
---------------------------
s = "hello"
# Finding the position of a substring or pattern match
s.index('l')         # => 2: index of first l in string
s.index(?l)          # => 2: works with character codes as well
s.index(/l+/)        # => 2: works with regular expressions, too
s.index('l',3)       # => 3: index of first l in string at or after position 3
s.index('Ruby')      # => nil: search string not found
s.rindex('l')        # => 3: index of rightmost l in string
s.rindex('l',2)      # => 2: index of rightmost l in string at or before 2

# Checking for prefixes and suffixes: Ruby 1.9 and later
s.start_with? "hell" # => true.  Note singular "start" not "starts"
s.end_with? "bells"  # => false

# Testing for presence of substring
s.include?("ll")     # => true: "hello" includes "ll"
s.include?(?H)       # => false: "hello" does not include character H

# Pattern matching with regular expressions
s =~ /[aeiou]{2}/    # => nil: no double vowels in "hello"
s.match(/[aeiou]/) {|m| m.to_s} # => "e": return first vowel

# Splitting a string into substrings based on a delimiter string or pattern
"this is it".split     # => ["this", "is", "it"]: split on spaces by default
"hello".split('l')     # => ["he", "", "o"]
"1, 2,3".split(/,\s*/) # => ["1","2","3"]: comma and optional space delimiter

# Split a string into two parts plus a delimiter. Ruby 1.9 only.
# These methods always return arrays of 3 strings:
"banana".partition("an")  # => ["b", "an", "ana"] 
"banana".rpartition("an") # => ["ban", "an", "a"]: start from right
"a123b".partition(/\d+/)  # => ["a", "123", "b"]: works with Regexps, too

# Search and replace the first (sub, sub!) or all (gsub, gsub!)
# occurrences of the specified string or pattern.
# More about sub and gsub when we cover regular expressions later.
s.sub("l", "L")            # => "heLlo": Just replace first occurrence
s.gsub("l", "L")           # => "heLLo": Replace all occurrences
s.sub!(/(.)(.)/, '\2\1')   # => "ehllo": Match and swap first 2 letters
s.sub!(/(.)(.)/, "\\2\\1") # => "hello": Double backslashes for double quotes

# sub and gsub can also compute a replacement string with a block
# Match the first letter of each word and capitalize it
"hello world".gsub(/\b./) {|match| match.upcase } # => "Hello World"
---------------------------
# Case modification methods
s = "world"   # These methods work with ASCII characters only
s.upcase      # => "WORLD"
s.upcase!     # => "WORLD"; alter s in place
s.downcase    # => "world"
s.capitalize  # => "World": first letter upper, rest lower
s.capitalize! # => "World": alter s in place
s.swapcase    # => "wORLD": alter case of each letter

# Case insensitive comparison. (ASCII text only)
# casecmp works like <=> and returns -1 for less, 0 for equal, +1 for greater
"world".casecmp("WORLD")  # => 0 
"a".casecmp("B")          # => -1 (<=> returns 1 in this case)
---------------------------
s = "hello\r\n"      # A string with a line terminator
s.chomp!             # => "hello": remove one line terminator from end
s.chomp              # => "hello": no line terminator so no change
s.chomp!             # => nil: return of nil indicates no change made
s.chomp("o")         # => "hell": remove "o" from end
$/ = ";"             # Set global record separator $/ to semicolon
"hello;".chomp       # => "hello": now chomp removes semicolons and end

# chop removes trailing character or line terminator (\n, \r, or \r\n)
s = "hello\n"
s.chop!              # => "hello": line terminator removed. s modified.
s.chop               # => "hell": last character removed. s not modified.
"".chop              # => "": no characters to remove
"".chop!             # => nil: nothing changed

# Strip all whitespace (including \t, \r, \n) from left, right, or both
# strip!, lstrip! and rstrip! modify the string in place.
s = "\t hello \n"   # Whitespace at beginning and end
s.strip             # => "hello"
s.lstrip            # => "hello \n"
s.rstrip            # => "\t hello"

# Left-justify, right-justify, or center a string in a field n-characters wide.
# There are no mutator versions of these methods. See also printf method.
s = "x"
s.ljust(3)          # => "x  "
s.rjust(3)          # => "  x"
s.center(3)         # => " x "
s.center(5, '-')    # => "--x--": padding other than space are allowed
s.center(7, '-=')   # => "-=-x-=-": multicharacter padding allowed
---------------------------
s = "A\nB"                       # Three ASCII characters on two lines
s.each_byte {|b| print b, " " }  # Prints "65 10 66 "
s.each_line {|l| print l.chomp}  # Prints "AB"

# Sequentially iterate characters as 1-character strings
# Works in Ruby 1.9, or in 1.8 with the jcode library:
s.each_char { |c| print c, " " } # Prints "A \n B "

# Enumerate each character as a 1-character string
# This does not work for multibyte strings in 1.8
# It works (inefficiently) for multibyte strings in 1.9:
0.upto(s.length-1) {|n| print s[n,1], " "}

# In Ruby 1.9, bytes, lines, and chars are aliases
s.bytes.to_a                     # => [65,10,66]: alias for each_byte
s.lines.to_a                     # => ["A\n","B"]: alias for each_line
s.chars.to_a                     # => ["A", "\n", "B"] alias for each_char
---------------------------
"10".to_i          # => 10: convert string to integer
"10".to_i(2)       # => 2: argument is radix: between base-2 and base-36
"10x".to_i         # => 10: nonnumeric suffix is ignored. Same for oct, hex
" 10".to_i         # => 10: leading whitespace ignored
"ten".to_i         # => 0: does not raise exception on bad input
"10".oct           # => 8: parse string as base-8 integer
"10".hex           # => 16: parse string as hexadecimal integer
"0xff".hex         # => 255: hex numbers may begin with 0x prefix
" 1.1 dozen".to_f  # => 1.1: parse leading floating-point number
"6.02e23".to_f     # => 6.02e+23: exponential notation supported

"one".to_sym       # => :one -- string to symbol conversion
"two".intern       # => :two -- intern is a synonym for to_sym
---------------------------
# Increment a string:
"a".succ                      # => "b": the successor of "a". Also, succ!
"aaz".next                    # => "aba": next is a synonym. Also, next!
"a".upto("e") {|c| print c }  # Prints "abcde. upto iterator based on succ.

# Reverse a string:
"hello".reverse     # => "olleh". Also reverse!

# Debugging
"hello\n".dump      # => "\"hello\\n\"": Escape special characters
"hello\n".inspect   # Works much like dump

# Translation from one set of characters to another
"hello".tr("aeiou", "AEIOU")  # => "hEllO": capitalize vowels. Also tr!
"hello".tr("aeiou", " ")      # => "h ll ": convert vowels to spaces
"bead".tr_s("aeiou", " ")     # => "b d": convert and remove duplicates

# Checksums
"hello".sum          # => 532: weak 16-bit checksum
"hello".sum(8)       # => 20: 8 bit checksum instead of 16 bit
"hello".crypt("ab")  # => "abl0JrMf6tlhw": one way cryptographic checksum
                     # Pass two alphanumeric characters as "salt"
                     # The result may be platform-dependent

# Counting letters, deleting letters, and removing duplicates
"hello".count('aeiou')  # => 2: count lowercase vowels
"hello".delete('aeiou') # => "hll": delete lowercase vowels. Also delete!
"hello".squeeze('a-z')  # => "helo": remove runs of letters. Also squeeze!
# When there is more than one argument, take the intersection.
# Arguments that begin with ^ are negated.
"hello".count('a-z', '^aeiou')   # => 3: count lowercase consonants
"hello".delete('a-z', '^aeiou')  # => "eo: delete lowercase consonants
---------------------------
n, animal = 2, "mice"
"#{n+1} blind #{animal}"  # => '3 blind mice'
---------------------------
# Alternatives to the interpolation above
printf('%d blind %s', n+1, animal)  # Prints '3 blind mice', returns nil
sprintf('%d blind %s', n+1, animal) # => '3 blind mice'
'%d blind %s' % [n+1, animal]  # Use array on right if more than one argument

# Formatting numbers
'%d' % 10         # => '10': %d for decimal integers
'%x' % 10         # => 'a': hexadecimal integers
'%X' % 10         # => 'A': uppercase hexadecimal integers
'%o' % 10         # => '12': octal integers
'%f' % 1234.567   # => '1234.567000': full-length floating-point numbers
'%e' % 1234.567   # => '1.234567e+03': force exponential notation
'%E' % 1234.567   # => '1.234567e+03': exponential with uppercase E
'%g' % 1234.567   # => '1234.57': six significant digits
'%g' % 1.23456E12 # => '1.23456e+12': Use %f or %e depending on magnitude

# Field width
'%5s' % '<<<'     # '  <<<': right-justify in field five characters wide
'%-5s' % '>>>'    # '>>>  ': left-justify in field five characters wide
'%5d' % 123       # '  123': field is five characters wide
'%05d' % 123      # '00123': pad with zeros in field five characters wide

# Precision
'%.2f' % 123.456  # '123.46': two digits after decimal place
'%.2e' % 123.456  # '1.23e+02': two digits after decimal = three significant digits
'%.6e' % 123.456  # '1.234560e+02': note added zero 
'%.4g' % 123.456  # '123.5': four significant digits

# Field and precision combined
'%6.4g' % 123.456 # ' 123.5': four significant digits in field six chars wide
'%3s' % 'ruby'    # 'ruby': string argument exceeds field width
'%3.3s' % 'ruby'  # 'rub': precision forces truncation of string

# Multiple arguments to be formatted
args = ['Syntax Error', 'test.rb', 20]  # An array of arguments
"%s: in '%s' line %d" % args    # => "Syntax Error: in 'test.rb' line 20" 
# Same args, interpolated in different order!  Good for internationalization.
"%2$s:%3$d: %1$s" % args        # => "test.rb:20: Syntax Error"
---------------------------
a = [1,2,3,4,5,6,7,8,9,10]  # An array of 10 integers
b = a.pack('i10')           # Pack 10 4-byte integers (i) into binary string b
c = b.unpack('i*')          # Decode all (*) the 4-byte integers from b
c == a                      # => true

m = 'hello world'           # A message to encode
data = [m.size, m]          # Length first, then the bytes
template = 'Sa*'            # Unsigned short, any number of ASCII chars
b = data.pack(template)     # => "\v\000hello world"
b.unpack(template)          # => [11, "hello world"]
