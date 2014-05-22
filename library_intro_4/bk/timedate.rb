#!/usr/bin/env ruby
#
#   

print %^ *************Time & Date : timedate.rb ************

^

gets
print %^
*****************
*****************
^
gets
print %^
*****************
*****************
^
gets
print %^
*****************
*****************
^
gets
print %^
*****************
*****************
^
gets
print %^
*****************
*****************
^
gets
print %^
*****************
*****************
^
gets
print %^
*****************
*****************
^
__END__

---------------------------
# Creating Time objects
Time.now        # Returns a time object that represents the current time
Time.new        # A synonym for Time.now

Time.local(2007, 7, 8)          # July 8, 2007
Time.local(2007, 7, 8, 9, 10)   # July 8, 2007, 09:10am, local time
Time.utc(2007, 7, 8, 9, 10)     # July 8, 2007, 09:10 UTC
Time.gm(2007, 7, 8, 9, 10, 11)  # July 8, 2007, 09:10:11 GMT (same as UTC)

# One microsecond before the new millennium began in London
# We'll use this Time object in many examples below.
t = Time.utc(2000, 12, 31, 23, 59, 59, 999999)

# Components of a Time
t.year    # => 2000
t.month   # => 12: December
t.day     # => 31
t.wday    # => 0: day of week: 0 is Sunday
t.yday    # => 366: day of year: 2000 was a leap year
t.hour    # => 23: 24-hour clock
t.min     # => 59
t.sec     # => 59
t.usec    # => 999999: microseconds, not milliseconds
t.zone    # => "UTC": timezone name

# Get all components in an array that holds
# [sec,min,hour,day,month,year,wday,yday,isdst,zone]
# Note that we lose microseconds
values = t.to_a    # => [59, 59, 23, 31, 12, 2000, 0, 366, false, "UTC"]

# Arrays of this form can be passed to Time.local and Time.utc
values[5] += 1     # Increment the year
Time.utc(*values)  # => Mon Dec 31 23:59:59 UTC 2001

# Timezones and daylight savings time
t.zone       # => "UTC": return the timezone
t.utc?       # => true: t is in UTC time zone
t.utc_offset # => 0: UTC is 0 seconds offset from UTC
t.localtime  # Convert to local timezone. Mutates the Time object!
t.zone       # => "PST" (or whatever your timezone is)
t.utc?       # => false
t.utc_offset # => -28800: 8 hours before UTC
t.gmtime     # Convert back to UTC. Another mutator.
t.getlocal   # Return a new Time object in local zone
t.getutc     # Return a new Time object in UTC
t.isdst      # => false: UTC does not have DST. Note no ?.
t.getlocal.isdst # => false: no daylight savings time in winter.

# Weekday predicates: Ruby 1.9
t.sunday?    # => true
t.monday?    # => false
t.tuesday?   # etc.

# Formatting Times and Dates
t.to_s       # => "Sun Dec 31 23:59:59 UTC 2000": Ruby 1.8
t.to_s       # => "2000-12-31 23:59:59 UTC": Ruby 1.9 uses ISO-8601
t.ctime      # => "Sun Dec 31 23:59:59 2000": another basic format

# strftime interpolates date and time components into a template string
# Locale-independent formatting
t.strftime("%Y-%m-%d %H:%M:%S") # => "2000-12-31 23:59:59": ISO-8601 format
t.strftime("%H:%M")             # => "23:59": 24-hour time
t.strftime("%I:%M %p")          # => "11:59 PM": 12-hour clock

# Locale-dependent formats
t.strftime("%A, %B %d")         # => "Sunday, December 31"
t.strftime("%a, %b %d %y")      # => "Sun, Dec 31 00": 2-digit year
t.strftime("%x")                # => "12/31/00": locale-dependent format
t.strftime("%X")                # => "23:59:59"
t.strftime("%c")                # same as ctime

# Parsing Times and Dates
require 'parsedate'    # A versatile date/time parsing library
include ParseDate      # Include parsedate() as a global function
datestring = "2001-01-01"
values = parsedate(datestring)  # [2001, 1, 1, nil, nil, nil, nil, nil]
t = Time.local(*values)         # => Mon Jan 01 00:00:00 -0800 2001
s = t.ctime                     # => "Mon Jan  1 00:00:00 2001"
Time.local(*parsedate(s))==t    # => true

s = "2001-01-01 00:00:00-0500"  # midnight in New York
v = parsedate(s)                # => [2001, 1, 1, 0, 0, 0, "-0500", nil]
t = Time.local(*v)              # Loses time zone information!

# Time arithmetic
now = Time.now          # Current time
past = now - 10         # 10 seconds ago. Time - number => Time
future = now + 10       # 10 seconds from now Time + number => Time
future - now            # => 10  Time - Time => number of seconds

# Time comparisons
past <=> future         # => -1
past < future           # => true
now >= future           # => false
now == now              # => true

# Helper methods for working with time units other than seconds
class Numeric
  # Convert time intervals to seconds
  def milliseconds; self/1000.0; end
  def seconds; self; end
  def minutes; self*60; end
  def hours; self*60*60; end
  def days; self*60*60*24; end
  def weeks; self*60*60*24*7; end

  # Convert seconds to other intervals
  def to_milliseconds; self*1000; end
  def to_seconds; self; end
  def to_minutes; self/60.0; end
  def to_hours; self/(60*60.0); end
  def to_days; self/(60*60*24.0); end
  def to_weeks; self/(60*60*24*7.0); end
end

expires = now + 10.days     # 10 days from now
expires - now               # => 864000.0 seconds
(expires - now).to_hours    # => 240.0 hours

# Time represented internally as seconds since the (platform-dependent) epoch
t = Time.now.to_i    # => 1184036194 seconds since epoch
Time.at(t)           # => seconds since epoch to Time object
t = Time.now.to_f    # => 1184036322.90872: includes 908720 microseconds
Time.at(0)           # => Wed Dec 31 16:00:00 -0800 1969: epoch in local time
