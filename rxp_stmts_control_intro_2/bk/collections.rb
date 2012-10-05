#!/usr/bin/env ruby
puts __FILE__,__LINE__
puts ; gets

puts <<EOS


EOS

puts '(5..7).each {|x| print x } '                 # Prints "567"
(5..7).each {|x| print x }       ; puts;puts          # Prints "567"

puts '(5..7).each_with_index {|x,i| print x,i }'  # Prints "506172"
(5..7).each_with_index {|x,i| print x,i } ;puts; puts 

puts '(1..10).each_slice(4) {|x| print x }' # Prints "[1,2,3,4][5,6,7,8][9,10]"
(1..10).each_slice(4) {|x| print x } ; puts; puts

puts '(1..5).each_cons(3) {|x| print x }'    # Prints "[1,2,3][2,3,4][3,4,5]"
(1..5).each_cons(3) {|x| print x }; puts ; puts  
puts ; gets
puts 'data = [1,2,3,4]     	 # An enumerable collection '
data = [1,2,3,4] ; puts                        # An enumerable collection
puts 'roots = data.collect {|x| Math.sqrt(x)} # Collect roots of our data'
print roots = data.collect {|x| Math.sqrt(x)} ; puts;puts # Collect roots of our data
puts 'words = %w[hello world]                 # Another collection'
words = %w[hello world]                 # Another collection
puts 'upper = words.map {|x| x.upcase }       # Map is synonym of Collection'
print upper = words.map {|x| x.upcase } ; puts; puts       # Map to uppercase
puts ; gets

puts '(1..3).zip([4,5,6]) {|x| print x.inspect } # Prints "[1,4][2,5][3,6]"'
(1..3).zip([4,5,6]) {|x| print x.inspect };puts # Prints "[1,4][2,5][3,6]"
puts '(1..3).zip([4,5,6],[7,8]) {|x| print x}    # Prints "14725836"'
(1..3).zip([4,5,6],[7,8]) {|x| print x};puts    # Prints "14725836"
puts %q^(1..3).zip('a'..'c') {|x,y| print x,y }    # Prints "1a2b3c" ^
(1..3).zip('a'..'c') {|x,y| print x,y }    # Prints "1a2b3c"
puts ; gets

puts '(1..3).to_a       # => [1,2,3]'
print (1..3).to_a ;puts       # => [1,2,3]
puts '(1..3).entries    # => [1,2,3]'
print (1..3).entries;puts    # => [1,2,3]

require 'set'
puts '(1..3).to_set     # => #<Set: {1, 2, 3}>'
puts (1..3).to_set.inspect     # => #<Set: {1, 2, 3}>
puts ; gets

w = Set['apple','Beet','carrot']  # A set of words to sort
puts %q^w.sort                 # ['Beet','apple','carrot']: alphabetical^
print w.sort ;                    # ['Beet','apple','carrot']: alphabetical
puts
puts %q^w.sort {|a,b| b<=>a }          # ['carrot','apple','Beet']: reverse^
print w.sort {|a,b| b<=>a }          # ['carrot','apple','Beet']: reverse'
puts
puts %q^w.sort {|a,b| a.casecmp(b) }   # ['apple','Beet','carrot']: ignore case^
print w.sort {|a,b| a.casecmp(b) }   # ['apple','Beet','carrot']: ignore case
puts
puts %q^w.sort {|a,b| b.size<=>a.size} # ['carrot','apple','Beet']: reverse length^
print w.sort {|a,b| b.size<=>a.size} # ['carrot','apple','Beet']: reverse length
puts
# Case-insensitive sort
words = ['carrot', 'Beet', 'apple']
puts %q^ words.sort_by {|x| x.downcase}       # => ['apple', 'Beet', 'carrot']^
print words.sort_by {|x| x.downcase}       # => ['apple', 'Beet', 'carrot']
puts; gets

puts %q^
********************
primes = Set[2, 3, 5, 7]
primes.include? 2        # => true
primes.member? 1         # => false
********************
^

primes = Set[2, 3, 5, 7]
puts primes.include? 2        # => true
puts primes.member? 1         # => false
puts; gets

puts %q^
********************
# Find the first subarray that includes the number 1
data = [[1,2], [0,1], [7,8]]
data.find {|x| x.include? 1}     # => [1,2]
data.detect {|x| x.include? 3}   # => nil: no such element
********************
^
# Find the first subarray that includes the number 1
data = [[1,2], [0,1], [7,8]]
print data.find {|x| x.include? 1}; puts     # => [1,2]
puts data.detect {|x| x.include? 3}   # => nil: no such element
puts; gets
puts; gets

puts %q^
********************
data.find_index {|x| x.include? 1} # => 0: the first element matches
data.find_index {|x| x.include? 3} # => nil: no such element
********************
^

puts data.find_index {|x| x.include? 1} # => 0: the first element matches
puts data.find_index {|x| x.include? 3} # => nil: no such element
puts; gets
#---------------------------
puts %q^
********************
(1..8).select {|x| x%2==0}    # => [2,4,6,8]: select even elements
(1..8).find_all {|x| x%2==1}  # => [1,3,5,7]: find all odd elements
********************
^
print (1..8).select {|x| x%2==0}  ; puts   # => [2,4,6,8]: select even elements
print (1..8).find_all {|x| x%2==1} ; puts  # => [1,3,5,7]: find all odd elements
puts; gets
#---------------------------
puts %q^
********************
primes = [2,3,5,7]
primes.reject {|x| x%2==0}  # => [3,5,7]: reject the even ones
(1..8).partition {|x| x%2==0}  # => [[2, 4, 6, 8], [1, 3, 5, 7]]
********************
^
primes = [2,3,5,7]
print primes.reject {|x| x%2==0} ; puts  # => [3,5,7]: reject the even ones
print (1..8).partition {|x| x%2==0} ; puts  # => [[2, 4, 6, 8], [1, 3, 5, 7]]
puts; gets
#---------------------------
# Group programming languages by their first letter
puts %q^
********************
langs = %w[ java perl python ruby ]
groups = langs.group_by {|lang| lang[0] }
groups # => {"j"=>["java"], "p"=>["perl", "python"], "r"=>["ruby"]}
********************
^
langs = %w[ java perl python ruby ]
groups = langs.group_by {|lang| lang[0] }
groups # => {"j"=>["java"], "p"=>["perl", "python"], "r"=>["ruby"]}
puts; gets
#---------------------------
puts %q-
********************
langs = %w[ java perl python ruby ]
langs.grep(/^p/)                    # => [perl, python]: start with 'p'
langs.grep(/^p/) {|x| x.capitalize} # => [Perl, Python]: fix caps
data = [1, 17, 3.0, 4]
ints = data.grep(Integer)           # => [1, 17, 4]: only integers
small = ints.grep(0..9)             # [1,4]: only in range
********************
-
langs = %w[ java perl python ruby ]
print langs.grep(/^p/) ; puts               # => [perl, python]: start with 'p'
print langs.grep(/^p/) {|x| x.capitalize}; puts # => [Perl, Python]: fix caps
data = [1, 17, 3.0, 4] ; print data ; puts
ints = data.grep(Integer) ; print ints ; puts           # => [1, 17, 4]: only integers
small = ints.grep(0..9) ; print small ; puts             # [1,4]: only in range
puts; gets
#---------------------------
puts %q^
********************
p (1..5).first(2)      # => [1,2]
p (1..5).take(3)       # => [1,2,3]
p (1..5).drop(3)       # => [4,5]
#---------------------------
[1,2,3,nil,4].take_while {|x| x }  # => [1,2,3]: take until nil
[nil, 1, 2].drop_while {|x| !x }   # => [1,2]: drop leading nils
********************
^
p (1..5).first(2)      # => [1,2]
p (1..5).take(3)       # => [1,2,3]
p (1..5).drop(3)       # => [4,5]
#---------------------------
print [1,2,3,nil,4].take_while {|x| x }; puts  # => [1,2,3]: take until nil
print [nil, 1, 2].drop_while {|x| !x }; puts   # => [1,2]: drop leading nils
#---------------------------
puts; gets
puts %q^
********************
[10, 100, 1].min    # => 1
['a','c','b'].max   # => 'c'
#[10, 'a', []].min   # => ArgumentError: elements not comparable
#---------------------------
langs = %w[java perl python ruby]    # Which has the longest name?
langs.max {|a,b| a.size <=> b.size } # => "python": block compares 2
langs.max_by {|word| word.length }   # => "python": Ruby 1.9 only
#---------------------------
(1..100).minmax                   # => [1,100] min, max as numbers
(1..100).minmax_by {|n| n.to_s }  # => [1,99]  min, max as strings
********************
^
p [10, 100, 1].min    # => 1
p ['a','c','b'].max   # => 'c'
#[10, 'a', []].min   # => ArgumentError: elements not comparable
#---------------------------
p langs = %w[java perl python ruby]    # Which has the longest name?
p langs.max {|a,b| a.size <=> b.size } # => "python": block compares 2
p langs.max_by {|word| word.length }   # => "python": Ruby 1.9 only
#---------------------------
p (1..100).minmax                   # => [1,100] min, max as numbers
p (1..100).minmax_by {|n| n.to_s }  # => [1,99]  min, max as strings
puts; gets
#---------------------------
puts %q^
********************
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
********************
^
c = -2..2
p c.all? {|x| x>0}    # => false: not all values are > 0
p c.any? {|x| x>0}    # => true: some values are > 0
p c.none? {|x| x>2}   # => true: no values are > 2
p c.one? {|x| x>0}    # => false: more than one value is > 0
p c.one? {|x| x>2}    # => false: no values are > 2
p c.one? {|x| x==2}   # => true: one value == 2
p [1, 2, 3].all?      # => true: no values are nil or false
p [nil, false].any?   # => false: no true values
p [].none?            # => true: no non-false, non-nil values    
puts; gets
#---------------------------
puts %q^
********************
a = [1,1,2,3,5,8]
a.count(1)                # => 2: two elements equal 1
a.count {|x| x % 2 == 1}  # => 4: four elements are odd
#---------------------------
# How many negative numbers?
(-2..10).inject(0) {|num, x| x<0 ? num+1 : num }  # => 2
# Sum of word lengths
%w[pea queue are].inject(0) {|total, word| total + word.length }  # => 11
#---------------------------
sum = (1..5).inject {|total,x| total + x}  # => 15
prod = (1..5).inject {|total,x| total * x} # => 120
max = [1,3,2].inject {|m,x| m>x ? m : x}   # => 3
[1].inject {|total,x| total + x}           # => 1: block never called
********************
^
p a = [1,1,2,3,5,8]
p a.count(1)                # => 2: two elements equal 1
p a.count {|x| x % 2 == 1}  # => 4: four elements are odd
#---------------------------
# How many negative numbers?
p (-2..10).inject(0) {|num, x| x<0 ? num+1 : num }  # => 2
# Sum of word lengths
p %w[pea queue are].inject(0) {|total, word| total + word.length }  # => 11
#---------------------------
p sum = (1..5).inject {|total,x| total + x}  # => 15
p prod = (1..5).inject {|total,x| total * x} # => 120
p max = [1,3,2].inject {|m,x| m>x ? m : x}   # => 3
p [1].inject {|total,x| total + x}           # => 1: block never called
puts; gets
#---------------------------
puts %q^
********************
sum = (1..5).reduce(:+)                    # => 15
prod = (1..5).reduce(:*)                   # => 120
letters = ('a'..'e').reduce("-", :concat)  # => "-abcde"
********************
^
p sum = (1..5).reduce(:+)                    # => 15
p prod = (1..5).reduce(:*)                   # => 120
p letters = ('a'..'e').reduce("-", :concat)  # => "-abcde"
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
