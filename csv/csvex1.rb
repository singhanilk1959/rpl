#
#
require "csv"

print "hello"

CSV.foreach("data1") do | row |
   print row
   print row [0]
end
