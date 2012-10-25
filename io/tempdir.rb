#!/usr/bin/env ruby
# Tempdir usage
#
# The tmpdir adds tmpdir method to class Dir
require 'tmpdir'

puts %q^
require 'tmpdir'
p Dir.tmpdir
p Dir.pwd

^
p Dir.tmpdir
p Dir.pwd
gets
#p Dir.home
#p Dir.home("anils")

puts %q^
dir = Dir.new(".") ;
p dir.path
p Dir.entries(".")

^
dir = Dir.new(".") ;
p dir.path
p Dir.entries(".")

gets

puts %q^
Dir.entries(dir.path).each  do |filr|
   p filr
end
Dir.entries(".").each  do |filr|
   p filr
end

Dir.foreach(dir.path)  do |filr|

  p filr

end

^
gets
Dir.entries(dir.path).each  do |filr|
   p filr
end
Dir.entries(".").each  do |filr|
   p filr
end

Dir.foreach(dir.path)  do |filr|

  p filr

end

gets

puts %^
Dir.mkdir("aks123")
Dir.rmdir("aks123")

^
Dir.mkdir("aks123")
Dir.rmdir("aks123")

`rm -rf aks123`
puts %^
Dir.mkdir("aks123"); Dir.mkdir("aks123/F123"); Dir.mkdir("aks123/abcd")
p Dir.glob("File*")
p Dir["F*"]
p Dir["./**/F*"]
p Dir["./**/*"]
^
Dir.mkdir("aks123"); Dir.mkdir("aks123/F123"); Dir.mkdir("aks123/abcd")
p Dir.glob("File*")
p Dir["F*"]
p Dir["./**/F*"]
p Dir["./**/*"]
gets

puts %^
p Dir["a[kd]s*"]
p Dir["F[kd]l*"]
p Dir["F[id]l*"]
p Dir["F[id]l{e*,d*}"]
p Dir["F[id]l{a*,d*}"]

^
p Dir["a[kd]s*"]
p Dir["F[kd]l*"]
p Dir["F[id]l*"]
p Dir["F[id]l{e*,d*}"]
p Dir["F[id]l{a*,d*}"]

`rm -rf aks123`
