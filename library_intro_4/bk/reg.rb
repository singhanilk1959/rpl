#!/usr/bin/env ruby
# =~ is Ruby's basic pattern matching operator.
# One operand must be a regular expression and other String.
# It is implemented equivalently by Regex and String.
# Returns String index at which first match begins
# After any successful non-nil match, $~ holds a MatchObject data which
# contains the complete information about the match
# Regexp.last_match also returns the same MatchObject data
# match also returns the same MatchObject data

# /regexp/miox
# m: allow multiline text i.e treat newline as any other character
# i: ignore case
# x: Extended syntax: allow whitespace and comments in regex
# o: perform #{} interpolations only once

puts %q^
*****************
# =~ is Ruby's basic pattern matching operator.
# One operand must be a regular expression and other String.
# It is implemented equivalently by Regex and String.
# Returns String index at which first match begins
# After any successful non-nil match, $~ holds a MatchObject data which
# contains the complete information about the match
# Regexp.last_match also returns the same MatchObject data
# match also returns the same MatchObject data

# /regexp/miox
# m: allow multiline text i.e treat newline as any other character
# i: ignore case
# x: Extended syntax: allow whitespace and comments in regex
# o: perform #{} interpolations only once


****************
^
puts;gets
puts %q^
*****************
s = "hello world"
puts s =~ /x*/  # prints 0 as there is no match
puts s =~ /o+/  # prints 4 as there is  match at index 4
puts s =~ /el*/ #prints 1 as there is a match at index 1
puts  "***",$~.string,$~,$~.to_s,$~.pre_match,$~.post_match,"***"

****************
^
s = "hello world"
puts s =~ /x*/  # prints 0 as there is no match
puts s =~ /o+/  # prints 4 as there is  match at index 4
puts s =~ /el*/ #prints 1 as there is a match at index 1
puts  "***",$~.string,$~,$~.to_s,$~.pre_match,$~.post_match,"***"

puts;gets
puts %q^
*****************
r =  Regexp.last_match
puts  "***",r.string,r,r.to_s,r.pre_match,r.post_match,"***"

t = s.match(/el*/)
puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"

t = /el*/.match(s)
puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"

re = Regexp.new(/el*/)
t = re.match(s)
puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"
****************
^
puts;gets
r =  Regexp.last_match
puts  "***",r.string,r,r.to_s,r.pre_match,r.post_match,"***"

t = s.match(/el*/)
puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"

t = /el*/.match(s)
puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"

re = Regexp.new(/el*/)
t = re.match(s)
puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"

puts;gets
puts %q^
*****************
s = "Hello world"
if t = s.match(/he.*/)
	puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"
else
       puts "NO MATCH"
end
if t = s.match(/he.*/i)
	puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"
else
       puts "NO MATCH"
end

****************
^
puts;gets
s = "Hello world"
if t = s.match(/he.*/)
	puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"
else
       puts "NO MATCH"
end
if t = s.match(/he.*/i)
	puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"
else
       puts "NO MATCH"
end
puts;gets
puts %q^
*****************
s = "Hello 
	world"
if t = s.match(/he.*/i)
	puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"
else
       puts "NO MATCH"
end
if t = s.match(/he.*/im)
	puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"
else
       puts "NO MATCH"
end
if t = s.match(/he.*/ix)
	puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"
else
       puts "NO MATCH"
end
s = "Hello world"
if t = s.match(/he.*/ix)
	puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"
else
       puts "NO MATCH"
end



****************
^
puts;gets

s = "Hello 
	world"
if t = s.match(/he.*/i)
	puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"
else
       puts "NO MATCH"
end
if t = s.match(/he.*/im)
	puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"
else
       puts "NO MATCH"
end
if t = s.match(/he.*/ix)
	puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"
else
       puts "NO MATCH"
end
s = "Hello world"
if t = s.match(/he.*/ix)
	puts  "***",t.string,t,t.to_s,t.pre_match,t.post_match,"***"
else
       puts "NO MATCH"
end


puts;gets
puts %q%
*****************
/./                # Match any character except newline
/./m               # In multiline mode . matches newline, too
/\d/               # Match a digit /[0-9]/
/\D/               # Match a nondigit: /[^0-9]/
/\s/               # Match a whitespace character: /[ \t\r\n\f]/
/\S/               # Match nonwhitespace: /[^ \t\r\n\f]/
/\w/               # Match a single word character: /[A-Za-z0-9_]/
/\W/               # Match a nonword character: /[^A-Za-z0-9_]/

# Repetition
/ruby?/            # Match "rub" or "ruby": the y is optional
/ruby*/            # Match "rub" plus 0 or more ys
/ruby+/            # Match "rub" plus 1 or more ys
/\d{3}/            # Match exactly 3 digits
/\d{3,}/           # Match 3 or more digits
/\d{3,5}/          # Match 3, 4, or 5 digits

# Nongreedy repetition: match the smallest number of repetitions
/<.*>/             # Greedy repetition: matches "<ruby>perl>"
/<.*?>/            # Nongreedy: matches "<ruby>" in "<ruby>perl>" 
                   # Also nongreedy: ??, +?, and {n,m}?

****************
%
puts;gets
puts %q%
*****************
# Grouping with parentheses
/\D\d+/            # No group: + repeats \d
/(\D\d)+/          # Grouped: + repeats \D\d pair
/([Rr]uby(, )?)+/  # Match "Ruby", "Ruby, ruby, ruby", etc.

# Backreferences: matching a previously matched group again
/([Rr])uby&\1ails/ # Match ruby&rails or Ruby&Rails
/(['"])[^\1]*\1/   # Single or double-quoted string
                   #   \1 matches whatever the 1st group matched
                   #   \2 matches whatever the 2nd group matched, etc.

# Named groups and backreferences in Ruby 1.9: match a 4-letter palindrome
/(?<first>\w)(?<second>\w)\k<second>\k<first>/
/(?'first'\w)(?'second'\w)\k'second'\k'first'/ # Alternate syntax

****************
%
puts;gets
puts %q%
*****************
# Alternatives
/ruby|rube/        # Match "ruby" or "rube"
/rub(y|le))/       # Match "ruby" or "ruble"
/ruby(!+|\?)/      # "ruby" followed by one or more ! or one ?

# Anchors: specifying match position
/^Ruby/            # Match "Ruby" at the start of a string or internal line
/Ruby$/            # Match "Ruby" at the end of a string or line
/\ARuby/           # Match "Ruby" at the start of a string
/Ruby\Z/           # Match "Ruby" at the end of a string
/\bRuby\b/         # Match "Ruby" at a word boundary
/\brub\B/          # \B is nonword boundary:
                   #   match "rub" in "rube" and "ruby" but not alone
/Ruby(?=!)/        # Match "Ruby", if followed by an exclamation point
/Ruby(?!!)/        # Match "Ruby", if not followed by an exclamation point

****************
%
puts;gets
puts %q^
*****************
# Special syntax with parentheses
/R(?#comment)/     # Matches "R". All the rest is a comment
/R(?i)uby/         # Case-insensitive while matching "uby"
/R(?i:uby)/        # Same thing
/rub(?:y|le))/     # Group only without creating \1 backreference

# The x option allows comments and ignores whitespace
/  # This is not a Ruby comment. It is a literal part
   # of the regular expression, but is ignored.
   R      # Match a single letter R
   (uby)+ # Followed by one or more "uby"s
   \      # Use backslash for a nonignored space
/x                 # Closing delimiter. Don't forget the x option!

****************
^
puts;gets
puts %q^
*****************
---------------------------
pattern = /Ruby?/i      # Match "Rub" or "Ruby", case-insensitive
pattern =~ "backrub"    # Returns 4.
"rub ruby" =~ pattern   # 0
pattern =~ "r"          # nil
---------------------------
"hello" =~ /e\w{2}/     # 1: Match an e followed by 2 word characters
$~.string               # "hello": the complete string
$~.to_s                 # "ell": the portion that matched
$~.pre_match            # "h": the portion before the match
$~.post_match           # "o": the portion after the match

****************
^
puts;gets
puts %q^
*****************
# This is a pattern with three subpatterns
pattern = /(Ruby|Perl)(\s+)(rocks|sucks)!/ 
text = "Ruby\trocks!"     # Text that matches the pattern    
pattern =~ text           # => 0: pattern matches at the first character
data = Regexp.last_match  # => Get match details
data.size                 # => 4: MatchData objects behave like arrays
data[0]                   # => "Ruby\trocks!": the complete matched text
data[1]                   # => "Ruby": text matching first subpattern
data[2]                   # => "\t": text matching second subpattern
data[3]                   # => "rocks": text matching third subpattern
data[1,2]                 # => ["Ruby", "\t"]
data[1..3]                # => ["Ruby", "\t", "rocks"]
data.values_at(1,3)       # => ["Ruby", "rocks"]: only selected indexes
data.captures             # => ["Ruby", "\t", "rocks"]: only subpatterns
Regexp.last_match(3)      # => "rocks": same as Regexp.last_match[3]

# Start and end positions of matches
data.begin(0)             # => 0: start index of entire match
data.begin(2)             # => 4: start index of second subpattern
data.end(2)               # => 5: end index of second subpattern
data.offset(3)            # => [5,10]: start and end of third subpattern

****************
^
puts;gets
puts %q^
*****************
# Ruby 1.9 only
pattern = /(?<lang>Ruby|Perl) (?<ver>\d(\.\d)+) (?<review>rocks|sucks)!/ 
if (pattern =~ "Ruby 1.9.1 rocks!")
  $~[:lang]            # => "Ruby"
  $~[:ver]             # => "1.9.1"
  $~["review"]         # => "rocks"
  $~.offset(:ver)      # => [5,10] start and end offsets of version number
end
# Names of capturing groups and a map of group names to group numbers
pattern.names          # => ["lang", "ver", "review"]
pattern.named_captures # => {"lang"=>[1],"ver"=>[2],"review"=>[3]}
---------------------------
# Ruby 1.9 only
if /(?<lang>\w+) (?<ver>\d+\.(\d+)+) (?<review>\w+)/ =~ "Ruby 1.9 rules!"
  lang     # => "Ruby"
  ver      # => "1.9"
  review   # => "rules"
end
---------------------------
if data = pattern.match(text)  # Or: data = text.match(pattern)
  handle_match(data)
end
---------------------------
pattern.match(text) {|data| handle_match(data) }

****************
^
puts;gets
puts %q^
*****************
"ruby123"[/\d+/]              # "123"
"ruby123"[/([a-z]+)(\d+)/,1]  # "ruby"
"ruby123"[/([a-z]+)(\d+)/,2]  # "123"
---------------------------
r = "ruby123"
r.slice!(/\d+/)  # Returns "123", changes r to "ruby"
---------------------------
s = "one, two, three"
s.split            # ["one,","two,","three"]: whitespace delimiter by default
s.split(", ")      # ["one","two","three"]: hardcoded delimiter
s.split(/\s*,\s*/) # ["one","two","three"]: space is optional around comma
---------------------------
text = "hello world"
pattern = /l/
first = text.index(pattern)       # 2: first match starts at char 2
n = Regexp.last_match.end(0)      # 3: end position of first match
second = text.index(pattern, n)   # 3: search again from there
last = text.rindex(pattern)       # 9: rindex searches backward from end

****************
^
puts;gets
puts %q%
*****************
phone = gets                    # Read a phone number
phone.sub!(/#.*$/, "")          # Delete Ruby-style comments
phone.gsub!(/\D/, "")           # Remove anything other than digits
---------------------------
text.gsub!("rails", "Rails")     # Change "rails" to "Rails" throughout
---------------------------
text.gsub!(/\brails\b/, "Rails") # Capitalize the word "Rails" throughout
---------------------------
text.gsub(/\bruby\b/i, '<b>\0</b>')
---------------------------
text.gsub(/\bruby\b/i, "<b>#{$&}</b>")
---------------------------
# Strip pairs of quotes from a string
re = /(?<quote>['"])(?<body>[^'"]*)\k<quote>/
puts "These are 'quotes'".gsub(re, '\k<body>')
---------------------------
# Use consistent capitalization for the names of programming languages

****************
%
puts;gets
puts %q%
*****************
# Use consistent capitalization for the names of programming languages
text = "RUBY Java perl PyThOn"         # Text to modify
lang = /ruby|java|perl|python/i        # Pattern to match
text.gsub!(lang) {|l| l.capitalize }   # Fix capitalization
---------------------------
pattern = /(['"])([^\1]*)\1/   # Single- or double-quoted string
text.gsub!(pattern) do
  if ($1 == '"')   # If it was a double-quoted string
    "'#$2'"        # replace with single-quoted
  else             # Otherwise, if single-quoted
    "\"#$2\""      # replace with double-quoted
  end
end

****************
%
puts;gets
puts %q^
*****************

****************
^
puts;gets


__END__
/./                # Match any character except newline
/./m               # In multiline mode . matches newline, too
/\d/               # Match a digit /[0-9]/
/\D/               # Match a nondigit: /[^0-9]/
/\s/               # Match a whitespace character: /[ \t\r\n\f]/
/\S/               # Match nonwhitespace: /[^ \t\r\n\f]/
/\w/               # Match a single word character: /[A-Za-z0-9_]/
/\W/               # Match a nonword character: /[^A-Za-z0-9_]/

# Repetition
/ruby?/            # Match "rub" or "ruby": the y is optional
/ruby*/            # Match "rub" plus 0 or more ys
/ruby+/            # Match "rub" plus 1 or more ys
/\d{3}/            # Match exactly 3 digits
/\d{3,}/           # Match 3 or more digits
/\d{3,5}/          # Match 3, 4, or 5 digits

# Nongreedy repetition: match the smallest number of repetitions
/<.*>/             # Greedy repetition: matches "<ruby>perl>"
/<.*?>/            # Nongreedy: matches "<ruby>" in "<ruby>perl>" 
                   # Also nongreedy: ??, +?, and {n,m}?

# Grouping with parentheses
/\D\d+/            # No group: + repeats \d
/(\D\d)+/          # Grouped: + repeats \D\d pair
/([Rr]uby(, )?)+/  # Match "Ruby", "Ruby, ruby, ruby", etc.

# Backreferences: matching a previously matched group again
/([Rr])uby&\1ails/ # Match ruby&rails or Ruby&Rails
/(['"])[^\1]*\1/   # Single or double-quoted string
                   #   \1 matches whatever the 1st group matched
                   #   \2 matches whatever the 2nd group matched, etc.

# Named groups and backreferences in Ruby 1.9: match a 4-letter palindrome
/(?<first>\w)(?<second>\w)\k<second>\k<first>/
/(?'first'\w)(?'second'\w)\k'second'\k'first'/ # Alternate syntax

# Alternatives
/ruby|rube/        # Match "ruby" or "rube"
/rub(y|le))/       # Match "ruby" or "ruble"
/ruby(!+|\?)/      # "ruby" followed by one or more ! or one ?

# Anchors: specifying match position
/^Ruby/            # Match "Ruby" at the start of a string or internal line
/Ruby$/            # Match "Ruby" at the end of a string or line
/\ARuby/           # Match "Ruby" at the start of a string
/Ruby\Z/           # Match "Ruby" at the end of a string
/\bRuby\b/         # Match "Ruby" at a word boundary
/\brub\B/          # \B is nonword boundary:
                   #   match "rub" in "rube" and "ruby" but not alone
/Ruby(?=!)/        # Match "Ruby", if followed by an exclamation point
/Ruby(?!!)/        # Match "Ruby", if not followed by an exclamation point

# Special syntax with parentheses
/R(?#comment)/     # Matches "R". All the rest is a comment
/R(?i)uby/         # Case-insensitive while matching "uby"
/R(?i:uby)/        # Same thing
/rub(?:y|le))/     # Group only without creating \1 backreference

# The x option allows comments and ignores whitespace
/  # This is not a Ruby comment. It is a literal part
   # of the regular expression, but is ignored.
   R      # Match a single letter R
   (uby)+ # Followed by one or more "uby"s
   \      # Use backslash for a nonignored space
/x                 # Closing delimiter. Don't forget the x option!
---------------------------
pattern = /Ruby?/i      # Match "Rub" or "Ruby", case-insensitive
pattern =~ "backrub"    # Returns 4.
"rub ruby" =~ pattern   # 0
pattern =~ "r"          # nil
---------------------------
"hello" =~ /e\w{2}/     # 1: Match an e followed by 2 word characters
$~.string               # "hello": the complete string
$~.to_s                 # "ell": the portion that matched
$~.pre_match            # "h": the portion before the match
$~.post_match           # "o": the portion after the match
---------------------------
# This is a pattern with three subpatterns
pattern = /(Ruby|Perl)(\s+)(rocks|sucks)!/ 
text = "Ruby\trocks!"     # Text that matches the pattern    
pattern =~ text           # => 0: pattern matches at the first character
data = Regexp.last_match  # => Get match details
data.size                 # => 4: MatchData objects behave like arrays
data[0]                   # => "Ruby\trocks!": the complete matched text
data[1]                   # => "Ruby": text matching first subpattern
data[2]                   # => "\t": text matching second subpattern
data[3]                   # => "rocks": text matching third subpattern
data[1,2]                 # => ["Ruby", "\t"]
data[1..3]                # => ["Ruby", "\t", "rocks"]
data.values_at(1,3)       # => ["Ruby", "rocks"]: only selected indexes
data.captures             # => ["Ruby", "\t", "rocks"]: only subpatterns
Regexp.last_match(3)      # => "rocks": same as Regexp.last_match[3]

# Start and end positions of matches
data.begin(0)             # => 0: start index of entire match
data.begin(2)             # => 4: start index of second subpattern
data.end(2)               # => 5: end index of second subpattern
data.offset(3)            # => [5,10]: start and end of third subpattern
---------------------------
# Ruby 1.9 only
pattern = /(?<lang>Ruby|Perl) (?<ver>\d(\.\d)+) (?<review>rocks|sucks)!/ 
if (pattern =~ "Ruby 1.9.1 rocks!")
  $~[:lang]            # => "Ruby"
  $~[:ver]             # => "1.9.1"
  $~["review"]         # => "rocks"
  $~.offset(:ver)      # => [5,10] start and end offsets of version number
end
# Names of capturing groups and a map of group names to group numbers
pattern.names          # => ["lang", "ver", "review"]
pattern.named_captures # => {"lang"=>[1],"ver"=>[2],"review"=>[3]}
---------------------------
# Ruby 1.9 only
if /(?<lang>\w+) (?<ver>\d+\.(\d+)+) (?<review>\w+)/ =~ "Ruby 1.9 rules!"
  lang     # => "Ruby"
  ver      # => "1.9"
  review   # => "rules"
end
---------------------------
if data = pattern.match(text)  # Or: data = text.match(pattern)
  handle_match(data)
end
---------------------------
pattern.match(text) {|data| handle_match(data) }
---------------------------
"ruby123"[/\d+/]              # "123"
"ruby123"[/([a-z]+)(\d+)/,1]  # "ruby"
"ruby123"[/([a-z]+)(\d+)/,2]  # "123"
---------------------------
r = "ruby123"
r.slice!(/\d+/)  # Returns "123", changes r to "ruby"
---------------------------
s = "one, two, three"
s.split            # ["one,","two,","three"]: whitespace delimiter by default
s.split(", ")      # ["one","two","three"]: hardcoded delimiter
s.split(/\s*,\s*/) # ["one","two","three"]: space is optional around comma
---------------------------
text = "hello world"
pattern = /l/
first = text.index(pattern)       # 2: first match starts at char 2
n = Regexp.last_match.end(0)      # 3: end position of first match
second = text.index(pattern, n)   # 3: search again from there
last = text.rindex(pattern)       # 9: rindex searches backward from end
---------------------------
phone = gets                    # Read a phone number
phone.sub!(/#.*$/, "")          # Delete Ruby-style comments
phone.gsub!(/\D/, "")           # Remove anything other than digits
---------------------------
text.gsub!("rails", "Rails")     # Change "rails" to "Rails" throughout
---------------------------
text.gsub!(/\brails\b/, "Rails") # Capitalize the word "Rails" throughout
---------------------------
text.gsub(/\bruby\b/i, '<b>\0</b>')
---------------------------
text.gsub(/\bruby\b/i, "<b>#{$&}</b>")
---------------------------
# Strip pairs of quotes from a string
re = /(?<quote>['"])(?<body>[^'"]*)\k<quote>/
puts "These are 'quotes'".gsub(re, '\k<body>')
---------------------------
# Use consistent capitalization for the names of programming languages
text = "RUBY Java perl PyThOn"         # Text to modify
lang = /ruby|java|perl|python/i        # Pattern to match
text.gsub!(lang) {|l| l.capitalize }   # Fix capitalization
---------------------------
pattern = /(['"])([^\1]*)\1/   # Single- or double-quoted string
text.gsub!(pattern) do
  if ($1 == '"')   # If it was a double-quoted string
    "'#$2'"        # replace with single-quoted
  else             # Otherwise, if single-quoted
    "\"#$2\""      # replace with double-quoted
  end
end
---------------------------
/Ruby?/  # Matches the text "Rub" followed by an optional "y"
---------------------------
/ruby?/i  # Case-insensitive: matches "ruby" or "RUB", etc.
/./mu     # Matches Unicode characters in Multiline mode
---------------------------
%r|/|         # Matches a single slash character, no escape required
%r[</(.*)>]i  # Flag characters are allowed with this syntax, too
---------------------------
/\(\)/     # Matches open and close parentheses
/\\/       # Matches a single backslash
---------------------------
money = /[$\u20AC\u{a3}\u{a5}]/ # match dollar,euro,pound, or yen sign
---------------------------
prefix = ","
/#{prefix}\t/   # Matches a comma followed by an ASCII TAB character
---------------------------
[1,2].map{|x| /#{x}/}   # => [/1/, /2/]
[1,2].map{|x| /#{x}/o}  # => [/1/, /1/]
---------------------------
Regexp.new("Ruby?")                          # /Ruby?/
Regexp.new("ruby?", Regexp::IGNORECASE)      # /ruby?/i
Regexp.compile(".", Regexp::MULTILINE, "u")  # /./mu
---------------------------
pattern = "[a-z]+"                # One or more letters
suffix = Regexp.escape("()")      # Treat these characters literally
r = Regexp.new(pattern + suffix)  # /[a-z]+\(\)/
---------------------------
# Match any one of five language names.
pattern = Regexp.union("Ruby", "Perl", "Python", /Java(Script)?/)
# Match empty parens, brackets, or braces. Escaping is automatic:
Regexp.union("()", "[]", "{}")   # => /\(\)|\[\]|\{\}/
---------------------------
# Literal characters
/ruby/             # Match "ruby". Most characters simply match themselves.
/&#xA5;/                # Matches Yen sign. Multibyte characters are suported
                   # in Ruby 1.9 and Ruby 1.8.

# Character classes
/[Rr]uby/          # Match "Ruby" or "ruby"
/rub[ye]/          # Match "ruby" or "rube"
/[aeiou]/          # Match any one lowercase vowel
/[0-9]/            # Match any digit; same as /[0123456789]/
/[a-z]/            # Match any lowercase ASCII letter
/[A-Z]/            # Match any uppercase ASCII letter
/[a-zA-Z0-9]/      # Match any of the above
/[^aeiou]/         # Match anything other than a lowercase vowel
/[^0-9]            # Match anything other than a digit

# Special character classes
/./                # Match any character except newline
/./m               # In multiline mode . matches newline, too
/\d/               # Match a digit /[0-9]/
/\D/               # Match a nondigit: /[^0-9]/
/\s/               # Match a whitespace character: /[ \t\r\n\f]/
/\S/               # Match nonwhitespace: /[^ \t\r\n\f]/
/\w/               # Match a single word character: /[A-Za-z0-9_]/
/\W/               # Match a nonword character: /[^A-Za-z0-9_]/

# Repetition
/ruby?/            # Match "rub" or "ruby": the y is optional
/ruby*/            # Match "rub" plus 0 or more ys
/ruby+/            # Match "rub" plus 1 or more ys
/\d{3}/            # Match exactly 3 digits
/\d{3,}/           # Match 3 or more digits
/\d{3,5}/          # Match 3, 4, or 5 digits

# Nongreedy repetition: match the smallest number of repetitions
/<.*>/             # Greedy repetition: matches "<ruby>perl>"
/<.*?>/            # Nongreedy: matches "<ruby>" in "<ruby>perl>" 
                   # Also nongreedy: ??, +?, and {n,m}?

# Grouping with parentheses
/\D\d+/            # No group: + repeats \d
/(\D\d)+/          # Grouped: + repeats \D\d pair
/([Rr]uby(, )?)+/  # Match "Ruby", "Ruby, ruby, ruby", etc.

# Backreferences: matching a previously matched group again
/([Rr])uby&\1ails/ # Match ruby&rails or Ruby&Rails
/(['"])[^\1]*\1/   # Single or double-quoted string
                   #   \1 matches whatever the 1st group matched
                   #   \2 matches whatever the 2nd group matched, etc.

# Named groups and backreferences in Ruby 1.9: match a 4-letter palindrome
/(?<first>\w)(?<second>\w)\k<second>\k<first>/
/(?'first'\w)(?'second'\w)\k'second'\k'first'/ # Alternate syntax

# Alternatives
/ruby|rube/        # Match "ruby" or "rube"
/rub(y|le))/       # Match "ruby" or "ruble"
/ruby(!+|\?)/      # "ruby" followed by one or more ! or one ?

# Anchors: specifying match position
/^Ruby/            # Match "Ruby" at the start of a string or internal line
/Ruby$/            # Match "Ruby" at the end of a string or line
/\ARuby/           # Match "Ruby" at the start of a string
/Ruby\Z/           # Match "Ruby" at the end of a string
/\bRuby\b/         # Match "Ruby" at a word boundary
/\brub\B/          # \B is nonword boundary:
                   #   match "rub" in "rube" and "ruby" but not alone
/Ruby(?=!)/        # Match "Ruby", if followed by an exclamation point
/Ruby(?!!)/        # Match "Ruby", if not followed by an exclamation point

# Special syntax with parentheses
/R(?#comment)/     # Matches "R". All the rest is a comment
/R(?i)uby/         # Case-insensitive while matching "uby"
/R(?i:uby)/        # Same thing
/rub(?:y|le))/     # Group only without creating \1 backreference

# The x option allows comments and ignores whitespace
/  # This is not a Ruby comment. It is a literal part
   # of the regular expression, but is ignored.
   R      # Match a single letter R
   (uby)+ # Followed by one or more "uby"s
   \      # Use backslash for a nonignored space
/x                 # Closing delimiter. Don't forget the x option!
---------------------------
pattern = /Ruby?/i      # Match "Rub" or "Ruby", case-insensitive
pattern =~ "backrub"    # Returns 4.
"rub ruby" =~ pattern   # 0
pattern =~ "r"          # nil
---------------------------
"hello" =~ /e\w{2}/     # 1: Match an e followed by 2 word characters
$~.string               # "hello": the complete string
$~.to_s                 # "ell": the portion that matched
$~.pre_match            # "h": the portion before the match
$~.post_match           # "o": the portion after the match
---------------------------
# This is a pattern with three subpatterns
pattern = /(Ruby|Perl)(\s+)(rocks|sucks)!/ 
text = "Ruby\trocks!"     # Text that matches the pattern    
pattern =~ text           # => 0: pattern matches at the first character
data = Regexp.last_match  # => Get match details
data.size                 # => 4: MatchData objects behave like arrays
data[0]                   # => "Ruby\trocks!": the complete matched text
data[1]                   # => "Ruby": text matching first subpattern
data[2]                   # => "\t": text matching second subpattern
data[3]                   # => "rocks": text matching third subpattern
data[1,2]                 # => ["Ruby", "\t"]
data[1..3]                # => ["Ruby", "\t", "rocks"]
data.values_at(1,3)       # => ["Ruby", "rocks"]: only selected indexes
data.captures             # => ["Ruby", "\t", "rocks"]: only subpatterns
Regexp.last_match(3)      # => "rocks": same as Regexp.last_match[3]

# Start and end positions of matches
data.begin(0)             # => 0: start index of entire match
data.begin(2)             # => 4: start index of second subpattern
data.end(2)               # => 5: end index of second subpattern
data.offset(3)            # => [5,10]: start and end of third subpattern
---------------------------
# Ruby 1.9 only
pattern = /(?<lang>Ruby|Perl) (?<ver>\d(\.\d)+) (?<review>rocks|sucks)!/ 
if (pattern =~ "Ruby 1.9.1 rocks!")
  $~[:lang]            # => "Ruby"
  $~[:ver]             # => "1.9.1"
  $~["review"]         # => "rocks"
  $~.offset(:ver)      # => [5,10] start and end offsets of version number
end
# Names of capturing groups and a map of group names to group numbers
pattern.names          # => ["lang", "ver", "review"]
pattern.named_captures # => {"lang"=>[1],"ver"=>[2],"review"=>[3]}
---------------------------
# Ruby 1.9 only
if /(?<lang>\w+) (?<ver>\d+\.(\d+)+) (?<review>\w+)/ =~ "Ruby 1.9 rules!"
  lang     # => "Ruby"
  ver      # => "1.9"
  review   # => "rules"
end
---------------------------
if data = pattern.match(text)  # Or: data = text.match(pattern)
  handle_match(data)
end
---------------------------
pattern.match(text) {|data| handle_match(data) }
---------------------------
"ruby123"[/\d+/]              # "123"
"ruby123"[/([a-z]+)(\d+)/,1]  # "ruby"
"ruby123"[/([a-z]+)(\d+)/,2]  # "123"
---------------------------
r = "ruby123"
r.slice!(/\d+/)  # Returns "123", changes r to "ruby"
---------------------------
s = "one, two, three"
s.split            # ["one,","two,","three"]: whitespace delimiter by default
s.split(", ")      # ["one","two","three"]: hardcoded delimiter
s.split(/\s*,\s*/) # ["one","two","three"]: space is optional around comma
---------------------------
text = "hello world"
pattern = /l/
first = text.index(pattern)       # 2: first match starts at char 2
n = Regexp.last_match.end(0)      # 3: end position of first match
second = text.index(pattern, n)   # 3: search again from there
last = text.rindex(pattern)       # 9: rindex searches backward from end
---------------------------
phone = gets                    # Read a phone number
phone.sub!(/#.*$/, "")          # Delete Ruby-style comments
phone.gsub!(/\D/, "")           # Remove anything other than digits
---------------------------
text.gsub!("rails", "Rails")     # Change "rails" to "Rails" throughout
---------------------------
text.gsub!(/\brails\b/, "Rails") # Capitalize the word "Rails" throughout
---------------------------
text.gsub(/\bruby\b/i, '<b>\0</b>')
---------------------------
text.gsub(/\bruby\b/i, "<b>#{$&}</b>")
---------------------------
# Strip pairs of quotes from a string
re = /(?<quote>['"])(?<body>[^'"]*)\k<quote>/
puts "These are 'quotes'".gsub(re, '\k<body>')
---------------------------
# Use consistent capitalization for the names of programming languages
text = "RUBY Java perl PyThOn"         # Text to modify
lang = /ruby|java|perl|python/i        # Pattern to match
text.gsub!(lang) {|l| l.capitalize }   # Fix capitalization
---------------------------
pattern = /(['"])([^\1]*)\1/   # Single- or double-quoted string
text.gsub!(pattern) do
  if ($1 == '"')   # If it was a double-quoted string
    "'#$2'"        # replace with single-quoted
  else             # Otherwise, if single-quoted
    "\"#$2\""      # replace with double-quoted
  end
end
