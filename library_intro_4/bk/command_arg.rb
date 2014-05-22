#!/usr/bin/env ruby
#Example command line:
#
#   hello -n 6 --name -- /tmp
#
 require 'getoptlong'

 print "NO_ARGUMENT", GetoptLong::NO_ARGUMENT 

 begin
  opts = GetoptLong.new(
    [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
    [ '--repeat', '-n', GetoptLong::REQUIRED_ARGUMENT ],
    [ '--name', GetoptLong::OPTIONAL_ARGUMENT ]
  )  
#  rescue Exception => ex
#  rescue StandardError 
#  rescue ArgumentError1 
#  puts
#  hello 
#  rescue Exception => ex
  rescue StandardError => ex 
#  rescue ArgumentError 
	 print ex 
	 print "HELLO WORLD"
          exit 0
 end

     p opts
    puts "I am here"
#__END__

  dir = nil
  name = nil
  repetitions = 1

	 print "HELLO OPTS", " ", opts
	 print "END OPTS"
begin
  opts.each do |opt, arg|

    puts opt,arg
	 puts "NEXT"
   end
 rescue Exception => ex
    print ex ; puts ; puts "hello I am here5 "
 end
	 print "END1 OPTS"
 begin
  opts.each do |opt, arg|
    case opt
      when '--help'
        puts <<-EOF
  hello [OPTION] ... DIR

  -h, --help:
     show help

  --repeat x, -n x:
     repeat x times

  --name [name]:
     greet user by name, if name not supplied default is John

  DIR: The directory in which to issue the greeting.
        EOF
	exit 0
      when '--repeat'
        repetitions = arg.to_i
      when '--name'
        if arg == ''
          name = 'John'
        else
          name = arg
        end
    end
  end
	 print "HELLO WORLD5"

 # if ARGV.length == 1
  if ARGV.length == 0
    puts "Missing dir argument (try --help1)"
    exit!  0
  end
 rescue Exception => ex
    print ex ; puts ; puts "hello I am here9 "
 end

  puts " HERE 10 "

  o = STDOUT
  i = STDIN
  el = "\n"
  puts ARGV.class
  STDOUT << ARGV.class << "\n"

  STDOUT << ARGV << el << ARGF.argv << el

  dir = ARGV.shift

  Dir.chdir(dir)

  for i in (1..repetitions)
    print "Hello"
    if name
      print ", #{name}"
    end
    puts
  end

