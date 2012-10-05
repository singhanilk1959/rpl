#!/usr/bin/env ruby
#
#   
require 'set'

puts; print "Set Creation:" ; out1=gets ;

print '(1..5).to_set : ' , (1..5).to_set ; puts     # => #<Set: {5, 1, 2, 3, 4}>
print '[1,2,3].to_set : ', [1,2,3].to_set  ; puts     # => #<Set: {1, 2, 3}>

print 'Set.new(1..5) : ',  Set.new(1..5).inspect ; puts # => #<Set: {5, 1, 2, 3, 4}>
print 'Set.new([1,2,3]) : ',  Set.new([1,2,3]).inspect ; puts # => #<Set: {5, 1, 2, 3, 4}>

print 'Set.new([1,2,3]) {|x| x+1} : '	# => #<Set: {2, 3, 4}>
s = Set.new([1,2,3]) {|x| x+1} ; print s.inspect ; puts 

print 'Set["cow", "pig", "hen"] : '   # => #<Set: {"cow", "pig", "hen"}>
s = Set["cow", "pig", "hen"] ; print s.inspect ; puts

puts %q^
*********************
s = Set.new(1..3)   # => #<Set: {1, 2, 3}>  
s.include? 1        # => true
s.member? 0         # => false: member? is a synonym
---------------------------
s = Set[2, 3, 5]
t = Set[2, 3, 5, 7]
s.subset? t            # => true
t.subset? s            # => false
s.proper_subset? t     # => true
t.superset? s          # => true
t.proper_superset? s   # => true
s.subset? s            # => true
s.proper_subset? s     # => false

s = Set[2, 3, 5]
s.length               # => 3
s.size                 # => 3: a synonym for length
s.empty?               # => false
Set.new.empty?         # => true
*********************
^
puts ; gets
puts %q%
*********************
# Here are two simple sets
primes = Set[2, 3, 5, 7]
odds = Set[1, 3, 5, 7, 9]

# The intersection is the set of values that appear in both
primes & odds             # => #<Set: {5, 7, 3}>
primes.intersection(odds) # this is an explicitly named alias

# The union is the set of values that appear in either
primes | odds             # => #<Set: {5, 1, 7, 2, 3, 9}>
primes.union(odds)        # an explicitly named alias

# a-b: is the elements of a except for those also in b
primes-odds               # => #<Set: {2}>
odds-primes               # => #<Set: {1, 9}>
primes.difference(odds)   # A named method alias

# a^b is the set of values that appear in one set but not both: (a|b)-(a&b)
primes ^ odds             # => #<Set: {1, 2, 9}>
---------------------------

*********************
%
puts ; gets
puts %q^
*********************
s = Set[]              # start with an empty set
s << 1                 # => #<Set: {1}>
s.add 2                # => #<Set: {1, 2}>: add is a synonym for <<
s << 3 << 4 << 5       # => #<Set: {5, 1, 2, 3, 4}>: can be chained
s.add 3                # => #<Set: {5, 1, 2, 3, 4}>: value unchanged
s.add? 6               # => #<Set: {5, 6, 1, 2, 3, 4}>
s.add? 3               # => nil: the set was not changed 
---------------------------
s = (1..3).to_set   # => #<Set: {1, 2, 3}>
s.merge(2..5)       # => #<Set: {5, 1, 2, 3, 4}>
---------------------------
s = (1..3).to_set   # => #<Set: {1, 2, 3}>
s.delete 1          # => #<Set: {2, 3}>
s.delete 1          # => #<Set: {2, 3}>: unchanged
s.delete? 1         # => nil: returns nil when no change
s.delete? 2         # => #<Set: {3}>: otherwise returns set
---------------------------
s = (1..3).to_set   # => #<Set: {1, 2, 3}>
s.subtract(2..10)   # => #<Set: {1}>
---------------------------

*********************
^
puts ; gets
puts %q^
*********************
---------------------------
primes = Set[2, 3, 5, 7]       # set of prime numbers
primes.delete_if {|x| x%2==1}  # => #<Set: {2}>: remove odds
primes.delete_if {|x| x%2==1}  # => #<Set: {2}>: unchanged
primes.reject! {|x| x%2==1}    # => nil: unchanged

# Do an in-place intersection like this:
s = (1..5).to_set
t = (4..8).to_set
s.reject! {|x| not t.include? x}  # => #<Set: {5, 4}>
---------------------------
s = Set.new(1..3) # Initial set
s.replace(3..4)   # Replace all elements.  Argument is any enumerable
s.clear           # => #<Set: {}>
s.empty?          # => true
---------------------------
s = Set[1, 2, 3, 4, 5] # => #<Set: {5, 1, 2, 3, 4}>
s.each {|x| print x }  # prints "51234": arbitrary order before Ruby 1.9
s.map! {|x| x*x }      # => #<Set: {16, 1, 25, 9, 4}>
s.collect! {|x| x/2 }  # => #<Set: {0, 12, 2, 8, 4}>

*********************
^
puts ; gets
puts %q^
*********************
s = (1..3).to_set
s.to_a          # => [1, 2, 3]
s.to_s          # => "#<Set:0xb7e8f938>": not useful
s.inspect       # => "#<Set: {1, 2, 3}>": useful       
s == Set[3,2,1] # => true: uses eql? to compare set elements
---------------------------
# Classify set elements as even or odd
s = (0..3).to_set     # => #<Set: {0, 1, 2, 3}>
s.classify {|x| x%2}  # => {0=>#<Set: {0, 2}>, 1=>#<Set: {1, 3}>}
---------------------------
s.divide {|x| x%2}  # => #<Set: {#<Set: {0, 2}>, #<Set: {1, 3}>}>
---------------------------
s = %w[ant ape cow hen hog].to_set # A set of words
s.divide {|x,y| x[0] == y[0]}      # Divide into subsets by first letter
# => #<Set:{#<Set:{"hog", "hen"}>, #<Set:{"cow"}>, #<Set:{"ape", "ant"}>}>
---------------------------
s = %w[ant ape cow hen hog].to_set # A set of words
t = s.divide {|x,y| x[0] == y[0]}  # Divide it into subsets
t.flatten!                         # Flatten the subsets
t == s                             # => true

*********************
^
puts ; gets
puts %q^
*********************

*********************
^
puts ; gets
__END__

---------------------------
require 'set'
---------------------------
(1..5).to_set              # => #<Set: {5, 1, 2, 3, 4}>
[1,2,3].to_set             # => #<Set: {1, 2, 3}>
---------------------------
Set.new(1..5)              # => #<Set: {5, 1, 2, 3, 4}>
Set.new([1,2,3])           # => #<Set: {1, 2, 3}>
Set.new([1,2,3]) {|x| x+1} # => #<Set: {2, 3, 4}>
---------------------------
Set["cow", "pig", "hen"]   # => #<Set: {"cow", "pig", "hen"}>
---------------------------
s = Set.new(1..3)   # => #<Set: {1, 2, 3}>  
s.include? 1        # => true
s.member? 0         # => false: member? is a synonym
---------------------------
s = Set[2, 3, 5]
t = Set[2, 3, 5, 7]
s.subset? t            # => true
t.subset? s            # => false
s.proper_subset? t     # => true
t.superset? s          # => true
t.proper_superset? s   # => true
s.subset? s            # => true
s.proper_subset? s     # => false
---------------------------
s = Set[2, 3, 5]
s.length               # => 3
s.size                 # => 3: a synonym for length
s.empty?               # => false
Set.new.empty?         # => true
---------------------------
# Here are two simple sets
primes = Set[2, 3, 5, 7]
odds = Set[1, 3, 5, 7, 9]

# The intersection is the set of values that appear in both
primes & odds             # => #<Set: {5, 7, 3}>
primes.intersection(odds) # this is an explicitly named alias

# The union is the set of values that appear in either
primes | odds             # => #<Set: {5, 1, 7, 2, 3, 9}>
primes.union(odds)        # an explicitly named alias

# a-b: is the elements of a except for those also in b
primes-odds               # => #<Set: {2}>
odds-primes               # => #<Set: {1, 9}>
primes.difference(odds)   # A named method alias

# a^b is the set of values that appear in one set but not both: (a|b)-(a&b)
primes ^ odds             # => #<Set: {1, 2, 9}>
---------------------------
s = Set[]              # start with an empty set
s << 1                 # => #<Set: {1}>
s.add 2                # => #<Set: {1, 2}>: add is a synonym for <<
s << 3 << 4 << 5       # => #<Set: {5, 1, 2, 3, 4}>: can be chained
s.add 3                # => #<Set: {5, 1, 2, 3, 4}>: value unchanged
s.add? 6               # => #<Set: {5, 6, 1, 2, 3, 4}>
s.add? 3               # => nil: the set was not changed 
---------------------------
s = (1..3).to_set   # => #<Set: {1, 2, 3}>
s.merge(2..5)       # => #<Set: {5, 1, 2, 3, 4}>
---------------------------
s = (1..3).to_set   # => #<Set: {1, 2, 3}>
s.delete 1          # => #<Set: {2, 3}>
s.delete 1          # => #<Set: {2, 3}>: unchanged
s.delete? 1         # => nil: returns nil when no change
s.delete? 2         # => #<Set: {3}>: otherwise returns set
---------------------------
s = (1..3).to_set   # => #<Set: {1, 2, 3}>
s.subtract(2..10)   # => #<Set: {1}>
---------------------------
primes = Set[2, 3, 5, 7]       # set of prime numbers
primes.delete_if {|x| x%2==1}  # => #<Set: {2}>: remove odds
primes.delete_if {|x| x%2==1}  # => #<Set: {2}>: unchanged
primes.reject! {|x| x%2==1}    # => nil: unchanged

# Do an in-place intersection like this:
s = (1..5).to_set
t = (4..8).to_set
s.reject! {|x| not t.include? x}  # => #<Set: {5, 4}>
---------------------------
s = Set.new(1..3) # Initial set
s.replace(3..4)   # Replace all elements.  Argument is any enumerable
s.clear           # => #<Set: {}>
s.empty?          # => true
---------------------------
s = Set[1, 2, 3, 4, 5] # => #<Set: {5, 1, 2, 3, 4}>
s.each {|x| print x }  # prints "51234": arbitrary order before Ruby 1.9
s.map! {|x| x*x }      # => #<Set: {16, 1, 25, 9, 4}>
s.collect! {|x| x/2 }  # => #<Set: {0, 12, 2, 8, 4}>
---------------------------
s = (1..3).to_set
s.to_a          # => [1, 2, 3]
s.to_s          # => "#<Set:0xb7e8f938>": not useful
s.inspect       # => "#<Set: {1, 2, 3}>": useful       
s == Set[3,2,1] # => true: uses eql? to compare set elements
---------------------------
# Classify set elements as even or odd
s = (0..3).to_set     # => #<Set: {0, 1, 2, 3}>
s.classify {|x| x%2}  # => {0=>#<Set: {0, 2}>, 1=>#<Set: {1, 3}>}
---------------------------
s.divide {|x| x%2}  # => #<Set: {#<Set: {0, 2}>, #<Set: {1, 3}>}>
---------------------------
s = %w[ant ape cow hen hog].to_set # A set of words
s.divide {|x,y| x[0] == y[0]}      # Divide into subsets by first letter
# => #<Set:{#<Set:{"hog", "hen"}>, #<Set:{"cow"}>, #<Set:{"ape", "ant"}>}>
---------------------------
s = %w[ant ape cow hen hog].to_set # A set of words
t = s.divide {|x,y| x[0] == y[0]}  # Divide it into subsets
t.flatten!                         # Flatten the subsets
t == s                             # => true
