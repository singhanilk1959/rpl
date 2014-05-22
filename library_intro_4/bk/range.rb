#!/usr/bin/env ruby 
# 
# A Range Object represents the value  between a start value and end value.
# .. is used when the range is inclusive i.e end value is the part of the range
# ... is used for exlusive range i.e end value is not the part of range 
#
# A value can only be used as a Range Object if it responds to <=>.
# A Range Object can be used in iteration if it defines succ method.
#
# When the .. and ... operators are used in a conditional, such 
# as an if statement or while loop, they do not create Range objects,
# but they create special boolean expression flip-flop which has a true
# or false value. The extraordinary thing is that its value deoend
# upon previously evaluated value.
#
# In .. Flip Flop, when it turns true, it immediateley checks the righthand 
# righthand expression. In ... Flip Flop, it does not check the righthand exp
# in first iteration.

puts %q^
*****************
# A Range Object represents the value  between a start value and end value.
# .. is used when the range is inclusive i.e end value is the part of the range
# ... is used for exlusive range i.e end value is not the part of range 
#
# A value can only be used as a Range Object if it responds to <=>.
# A Range Object can be used in iteration if it defines succ method.
#
# When the .. and ... operators are used in a conditional, such 
# as an if statement or while loop, they do not create Range objects,
# but they create special boolean expression flip-flop which has a true
# or false value. The extraordinary thing is that its value deoend
# upon previously evaluated value.
#
# In .. Flip Flop, when it turns true, it immediateley checks the righthand 
# righthand expression. In ... Flip Flop, it does not check the righthand exp
# in first iteration.
*****************
^
puts;gets
puts %q^
*****************
*****************
^
puts;gets
1..5   # Inclusive range
1...5  # Exclusive Range

print ' (5..7).each {|x| print x }  '             # Prints "567"
(5..7).each {|x| print x } ; puts  "  Inclusive Range" 

print ' (5..7).each_with_index {|x,i| print x,i }  '           
(5..7).each_with_index {|x,i| print x,i } ; puts  "  Inclusive Range" 

print ' (5...7).each {|x| print x }  '             # Prints "56"
(5...7).each {|x| print x } ; puts  "  Enclusive Range"      

print ' (5...7).each_with_index {|x,i| print x,i }  '       
(5...7).each_with_index {|x,i| print x,i } ; puts  "  Exlusive Range" 

line = gets

print '(1..10).each_slice(4) {|x| print x }  : '
(1..10).each_slice(4) {|x| print x } # Prints "[1,2,3,4][5,6,7,8][9,10]"

puts

print '(1..5).each_cons(3) {|x| print x }  : '
(1..5).each_cons(3) {|x| print x }    # Prints "[1,2,3][2,3,4][3,4,5]"

puts ;line = gets

print 'Range.new(1,5).each { |x| print x } : ' 
Range.new(1,5).each { |x| print x } ; puts
print 'Range.new(1,5,true).each { |x| print x } : ' 
Range.new(1,5,true).each { |x| print x } ; puts

#Flip-Flops

puts; puts "FLIP FLOPS ";
print '(1..10).each { |x| print x  if x==3..x==5 } : '
(1..10).each { |x| print x  if x==3..x==5 } ; puts 

print '(1..10).each { |x| print x  if x==3...x==5 } :' 
(1..10).each { |x| print x  if x==3...x==5 } ; puts

# In .. Flip Flop, when it turns true, it immediateley checks the righthand 
# righthand expression. In ... Flip Flop, it does not check the righthand exp
# in first iteration.

print '(1..10).each { |x| print x if x==3..x>=3 } : '
(1..10).each { |x| print x if x==3..x>=3 } ; puts ;
print '(1..10).each { |x| print x if x==3...x>=3 } :'
(1..10).each { |x| print x if x==3...x>=3 }; puts

puts
puts " Ruby inherits Flip Flops from Perl which inherits it from awk,sed"
puts
puts %q[lines =`ruby -n -e 'print if $_=~/Using/..$_=~/permission/' README`]
puts "It reads README line by line and starts printing at line containing Using
      and continues till line containing permission"
puts ;

lines =`ruby -n -e 'print if $_=~/Using/..$_=~/permission/' README`
print lines
puts

print '(1..5).to_a :' , (1..5).to_a, "\n"
print %q[('a'..'d').to_a :'] , ('a'..'d').to_a, "\n"



__END__
---------------------------
(5..7).each {|x| print x }                 # Prints "567"
(5..7).each_with_index {|x,i| print x,i }  # Prints "506172"
---------------------------
(1..10).each_slice(4) {|x| print x } # Prints "[1,2,3,4][5,6,7,8][9,10]"
---------------------------
(1..5).each_cons(3) {|x| print x }    # Prints "[1,2,3][2,3,4][3,4,5]"
---------------------------
data = [1,2,3,4]                        # An enumerable collection
roots = data.collect {|x| Math.sqrt(x)} # Collect roots of our data
words = %w[hello world]                 # Another collection
upper = words.map {|x| x.upcase }       # Map to uppercase
---------------------------
(1..3).zip([4,5,6]) {|x| print x.inspect } # Prints "[1,4][2,5][3,6]"
(1..3).zip([4,5,6],[7,8]) {|x| print x}    # Prints "14725836"
(1..3).zip('a'..'c') {|x,y| print x,y }    # Prints "1a2b3c"
---------------------------
(1..3).to_a       # => [1,2,3]
(1..3).entries    # => [1,2,3]
---------------------------
require 'set'
(1..3).to_set     # => #<Set: {1, 2, 3}>
---------------------------
e = [1..10].to_enum              # Uses Range.each
e = "test".enum_for(:each_byte)  # Uses String.each_byte
e = "test".each_byte             # Uses String.each_byte
---------------------------
"Ruby".each_char.max       # => "y"; Enumerable method of Enumerator
iter = "Ruby".each_char    # Create an Enumerator
loop { print iter.next }   # Prints "Ruby"; use it as external iterator
print iter.next            # Prints "R": iterator restarts automatically
iter.rewind                # Force it to restart now
print iter.next            # Prints "R" again
---------------------------
# Print "0:R\n1:u\n2:b\n3:y\n"
"Ruby".each_char.with_index.each {|c,i| puts "#{i}:#{c} }
---------------------------
w = Set['apple','Beet','carrot']  # A set of words to sort
w.sort                         # ['Beet','apple','carrot']: alphabetical
w.sort {|a,b| b<=>a }          # ['carrot','apple','Beet']: reverse
w.sort {|a,b| a.casecmp(b) }   # ['apple','Beet','carrot']: ignore case
w.sort {|a,b| b.size<=>a.size} # ['carrot','apple','Beet']: reverse length
---------------------------
# Case-insensitive sort
words = ['carrot', 'Beet', 'apple']
words.sort_by {|x| x.downcase}       # => ['apple', 'Beet', 'carrot']
---------------------------
primes = Set[2, 3, 5, 7]
primes.include? 2        # => true
primes.member? 1         # => false
---------------------------
# Find the first subarray that includes the number 1
data = [[1,2], [0,1], [7,8]]
data.find {|x| x.include? 1}     # => [1,2]
data.detect {|x| x.include? 3}   # => nil: no such element
---------------------------
data.find_index {|x| x.include? 1} # => 0: the first element matches
data.find_index {|x| x.include? 3} # => nil: no such element
---------------------------
(1..8).select {|x| x%2==0}    # => [2,4,6,8]: select even elements
(1..8).find_all {|x| x%2==1}  # => [1,3,5,7]: find all odd elements
---------------------------
primes = [2,3,5,7]
primes.reject {|x| x%2==0}  # => [3,5,7]: reject the even ones
---------------------------
(1..8).partition {|x| x%2==0}  # => [[2, 4, 6, 8], [1, 3, 5, 7]]
---------------------------
# Group programming languages by their first letter
langs = %w[ java perl python ruby ]
groups = langs.group_by {|lang| lang[0] }
groups # => {"j"=>["java"], "p"=>["perl", "python"], "r"=>["ruby"]}
---------------------------
langs = %w[ java perl python ruby ]
langs.grep(/^p/)                    # => [perl, python]: start with 'p'
langs.grep(/^p/) {|x| x.capitalize} # => [Perl, Python]: fix caps
data = [1, 17, 3.0, 4]
ints = data.grep(Integer)           # => [1, 17, 4]: only integers
small = ints.grep(0..9)             # [1,4]: only in range
---------------------------
p (1..5).first(2)      # => [1,2]
p (1..5).take(3)       # => [1,2,3]
p (1..5).drop(3)       # => [4,5]
---------------------------
[1,2,3,nil,4].take_while {|x| x }  # => [1,2,3]: take until nil
[nil, 1, 2].drop_while {|x| !x }   # => [1,2]: drop leading nils
---------------------------
[10, 100, 1].min    # => 1
['a','c','b'].max   # => 'c'
[10, 'a', []].min   # => ArgumentError: elements not comparable
---------------------------
langs = %w[java perl python ruby]    # Which has the longest name?
langs.max {|a,b| a.size <=> b.size } # => "python": block compares 2
langs.max_by {|word| word.length }   # => "python": Ruby 1.9 only
---------------------------
(1..100).minmax                   # => [1,100] min, max as numbers
(1..100).minmax_by {|n| n.to_s }  # => [1,99]  min, max as strings
---------------------------
c = -2..2
c.all? {|x| x>0}    # => false: not all values are > 0
c.any? {|x| x>0}    # => true: some values are > 0
c.none? {|x| x>2}   # => true: no values are > 2
c.one? {|x| x>0}    # => false: more than one value is > 0
c.one? {|x| x>2}    # => false: no values are > 2
c.one? {|x| x==2}   # => true: one value == 2
[1, 2, 3].all?      # => true: no values are nil or false
[nil, false].any?   # => false: no true values
[].none?            # => true: no non-false, non-nil values    
---------------------------
a = [1,1,2,3,5,8]
a.count(1)                # => 2: two elements equal 1
a.count {|x| x % 2 == 1}  # => 4: four elements are odd
---------------------------
# How many negative numbers?
(-2..10).inject(0) {|num, x| x<0 ? num+1 : num }  # => 2

# Sum of word lengths
%w[pea queue are].inject(0) {|total, word| total + word.length }  # => 11
---------------------------
sum = (1..5).inject {|total,x| total + x}  # => 15
prod = (1..5).inject {|total,x| total * x} # => 120
max = [1,3,2].inject {|m,x| m>x ? m : x}   # => 3
[1].inject {|total,x| total + x}           # => 1: block never called
---------------------------
sum = (1..5).reduce(:+)                    # => 15
prod = (1..5).reduce(:*)                   # => 120
letters = ('a'..'e').reduce("-", :concat)  # => "-abcde"
