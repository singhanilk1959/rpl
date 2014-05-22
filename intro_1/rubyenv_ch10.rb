#!/usr/bin/env ruby
#
print %^
ruby [options] [--] program [arguments]
---------------------------
require 'library'
---------------------------
# -n option effect
while gets             # Read a line of input into $_
  $F = split if $-a    # Split $_ into fields if -a was specified
  chop! if $-l         # Chop line ending off $_ if -l was specified
  # Program text here
end
---------------------------
# -p option effect
while gets             # Read a line of input into $_
  $F = split if $-a    # Split $_ into fields if -a was specified
  chop! if $-l         # Chop line ending off $_ if -l was specified
  # Program text here
  print                # Output $_ (adding $/ if -l was specified)
end
^
print %^
^
gets

print %^
When the Ruby Interpreter starts, a number of classes,modules,constants,and
global variables, and global functions are defined available for use by programs.


^
gets ; puts
print %^
---------------------------
Modules:

Comparable      FileTest        Marshal         Precision
Enumerable      GC              Math            Process
Errno           Kernel          ObjectSpace     Signal
---------------------------

Classes:
---------------------------
Array           File            Method          String
Bignum          Fixnum          Module          Struct
Binding         Float           NilClass        Symbol
Class           Hash            Numeric         Thread
Continuation    IO              Object          ThreadGroup
Data            Integer         Proc            Time
Dir             MatchData       Range           TrueClass
FalseClass      MatchingData    Regexp          UnboundMethod
---------------------------

Exception Classes:
---------------------------
ArgumentError           NameError               SignalException
EOFError                NoMemoryError           StandardError
Exception               NoMethodError           SyntaxError
FloatDomainError        NotImplementedError     SystemCallError
IOError                 RangeError              SystemExit
IndexError              RegexpError             SystemStackError
Interrupt               RuntimeError            ThreadError
LoadError               ScriptError             TypeError
LocalJumpError          SecurityError           ZeroDivisionError
---------------------------

Ruby 1.9 adds following modules, classes and Excepttions
---------------------------
BasicObject     FiberError      Mutex           VM
Fiber           KeyError        StopIteration
---------------------------
^
gets
print %^
# Print all modules (excluding classes)
puts Module.constants.sort.select {|x| eval(x.to_s).instance_of? Module}

# Print all classes (excluding exceptions)
puts Module.constants.sort.select {|x|
  c = eval(x.to_s)
  c.is_a? Class and not c.ancestors.include? Exception
}

# Print all exceptions
puts Module.constants.sort.select {|x|
  c = eval(x.to_s)
  c.instance_of? Class and c.ancestors.include? Exception
}
---------------------------
ruby -e 'puts Module.constants.sort.reject{|x| eval(x.to_s).is_a? Module}'
---------------------------
ruby -e 'puts global_variables.sort'
---------------------------
ruby -rEnglish -e 'puts global_variables.sort'
---------------------------
^
gets
print %^

The Kernel module, which is included by Object, defines a number of instance methods that serve as global functions. Because they are private, they must be invoked functionally, without an explicit receiver object.

---------------------------Keyword Functions-------------
block_given?    iterator?       loop            require
callcc          lambda          proc            throw
catch           load            raise
---------------------------Text Input Output Functions -------------------

format          print           puts            sprintf
gets            printf          readline
p               putc            readlines

---------------------------In 1.8 only, it is part of String in 1.9 on------------------------

chomp   chop    gsub    scan    sub
chomp!  chop!   gsub!   split   sub!

---------------------------OS methods ----------------------

`       fork    select  system  trap
exec    open    syscall test

---------------------------Warning,failures,and Exiting-----------

abort   at_exit exit    exit!   fail    warn

^
gets
print %^
---------------------------Reflection Functions ------------

binding                         set_trace_func
caller                          singleton_method_added
eval                            singleton_method_removed
global_variables                singleton_method_undefined
local_variables                 trace_var
method_missing                  untrace_var
remove_instance_variable

---------------------------Conversion Functions -------------

Array   Float   Integer String

--------------------------- Miscellaneous Kernel Functions -------------

autoload                rand                    srand
autoload?               sleep

---------------------------------
^
gets
print %q@
---------------------------
ruby -n -e 'print if /^A/' datafile
---------------------------
print if $_ =~ /^A/
---------------------------

os = `uname`             # String literal and method invocation in one
os = %x{uname}           # Another quoting syntax
os = Kernel.`("uname")   # Invoke the method explicitly
---------------------------
files = `echo *.xml`
---------------------------
pipe = open("|echo *.xml")
files = pipe.readline
pipe.close
---------------------------
fork {
  puts "Hello from the child process: #$$"
}
puts "Hello from the parent process: #$$"
@
gets
print %q@
---------------------------
pid = fork
if (pid)
  puts "Hello from parent process: #$$"
  puts "Created child process #{pid}"   
else
  puts Hello from child process: #$$"
end
---------------------------
open("|-", "r+") do |child|
  if child
    # This is the parent process
    child.puts("Hello child")       # Send to child
    response = child.gets           # Read from child
    puts "Child said: #{response}"
  else
    # This is the child process
    from_parent = gets              # Read from parent
    STDERR.puts "Parent said: #{from_parent}"
    puts("Hi Mom!")                 # Send to parent
  end
end
---------------------------
open("|-", "r") do |child|
  if child
    # This is the parent process
    files = child.readlines   # Read the output of our child
    child.close
  else
    # This is the child process
    exec("/bin/ls", "-l")     # Run another executable
  end
end
@
gets
print %q@
---------------------------
trap "SIGINT" {
  puts "Ignoring SIGINT"
}
---------------------------
fail "Unknown option #{switch}"
---------------------------
$SAFE=1                # upgrade the safe level
$SAFE=4                # upgrade the safe level even higher
$SAFE=0                # SecurityError!  you cant do it
---------------------------
Thread.start {     # Create a "sandbox" thread
  $SAFE = 4        # Restrict execution in this thread only
  ...              # Untrusted code can be run here
}
---------------------------
Dir.chdir               File.truncate           Process.egid=
Dir.chroot              File.umask              Process.fork
Dir.mkdir               IO.fctrl                Process.kill
Dir.rmdir               IO.ioctl                Process.setpgid
File.chmod              Kernel.exit!            Process.setpriority
File.chown              Kernel.fork             Process.setsid
File.flock              Kernel.syscall
File.lstat              Kernel.trap
---------------------------
def safe_eval(str)
  Thread.start {            # Start sandbox thread
    $SAFE = 4               # Upgrade safe level
    eval(str)               # Eval in the sandbox
  }.value                   # Retrieve result
end
---------------------------
@


