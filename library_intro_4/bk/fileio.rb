#!/usr/bin/env ruby
#
#   
__END__

---------------------------
full = '/home/matz/bin/ruby.exe'
file=File.basename(full)     # => 'ruby.exe': just the local filename
File.basename(full, '.exe')  # => 'ruby': with extension stripped
dir=File.dirname(full)       # => '/home/matz/bin': no / at end
File.dirname(file)           # => '.': current directory
File.split(full)             # => ['/home/matz/bin', 'ruby.exe']
File.extname(full)           # => '.exe'
File.extname(file)           # => '.exe'
File.extname(dir)            # => ''
File.join('home','matz')     # => 'home/matz': relative
File.join('','home','matz')  # => '/home/matz': absolute
---------------------------
Dir.chdir("/usr/bin")      # Current working directory is "/usr/bin"
File.expand_path("ruby")       # => "/usr/bin/ruby"
File.expand_path("~/ruby")     # => "/home/david/ruby"
File.expand_path("~matz/ruby") # => "/home/matz/ruby"
File.expand_path("ruby", "/usr/local/bin") # => "/usr/local/bin/ruby"
File.expand_path("ruby", "../local/bin")   # => "/usr/local/bin/ruby"
File.expand_path("ruby", "~/bin")          # => "/home/david/bin/ruby"
---------------------------
File.identical?("ruby", "ruby")          # => true if the file exists
File.identical?("ruby", "/usr/bin/ruby") # => true if CWD is /usr/bin
File.identical?("ruby", "../bin/ruby")   # => true if CWD is /usr/bin
File.identical?("ruby", "ruby1.9")       # => true if there is a link
---------------------------
File.fnmatch("*.rb", "hello.rb")     # => true
File.fnmatch("*.[ch]", "ruby.c")     # => true
File.fnmatch("*.[ch]", "ruby.h")     # => true
File.fnmatch("?.txt", "ab.txt")      # => false
flags = File::FNM_PATHNAME | File::FNM_DOTMATCH
File.fnmatch("lib/*.rb", "lib/a.rb", flags)      # => true
File.fnmatch("lib/*.rb", "lib/a/b.rb", flags)    # => false
File.fnmatch("lib/**/*.rb", "lib/a.rb", flags)   # => true
File.fnmatch("lib/**/*.rb", "lib/a/b.rb", flags) # => true
---------------------------
# Get the names of all files in the config/ directory 
filenames = Dir.entries("config")        # Get names as an array
Dir.foreach("config") {|filename| ... }  # Iterate names
---------------------------
Dir['*.data']       # Files with the "data" extension
Dir['ruby.*']       # Any filename beginning with "ruby."
Dir['?']            # Any single-character filename
Dir['*.[ch]']       # Any file that ends with .c or .h
Dir['*.{java,rb}']  # Any file that ends with .java or .rb
Dir['*/*.rb']       # Any Ruby program in any direct sub-directory
Dir['**/*.rb']      # Any Ruby program in any descendant directory
---------------------------
Dir.glob('*.rb') {|f| ... }      # Iterate all Ruby files
Dir.glob('*')                    # Does not include names beginning with '.'
Dir.glob('*',File::FNM_DOTMATCH) # Include . files, just like Dir.entries
---------------------------
puts Dir.getwd          # Print current working directory
Dir.chdir("..")         # Change CWD to the parent directory
Dir.chdir("../sibling") # Change again to a sibling directory
Dir.chdir("/home")      # Change to an absolute directory
Dir.chdir               # Change to user's home directory
home = Dir.pwd          # pwd is an alias for getwd
---------------------------
f = "/usr/bin/ruby"      # A filename for the examples below

# File existence and types.
File.exist?(f)           # Does the named file exist? Also: File.exists?
File.file?(f)            # Is it an existing file?
File.directory?(f)       # Or is it an existing directory?
File.symlink?(f)         # Either way, is it a symbolic link?

# File size methods. Use File.truncate to set file size.
File.size(f)             # File size in bytes.
File.size?(f)            # Size in bytes or nil if empty file.
File.zero?(f)            # True if file is empty.

# File permissions. Use File.chmod to set permissions (system dependent).
File.readable?(f)        # Can we read the file?
File.writable?(f)        # Can we write the file? No "e" in "writable"
File.executable?(f)      # Can we execute the file?
File.world_readable?(f)  # Can everybody read it? Ruby 1.9.
File.world_writable?(f)  # Can everybody write it? Ruby 1.9.

# File times/dates. Use File.utime to set the times.
File.mtime(f)            # => Last modification time as a Time object
File.atime(f)            # => Last access time as a Time object
---------------------------
File.ftype("/usr/bin/ruby")    # => "link"
File.ftype("/usr/bin/ruby1.9") # => "file"
File.ftype("/usr/lib/ruby")    # => "directory"
File.ftype("/usr/bin/ruby3.0") # SystemCallError: No such file or directory
---------------------------
s = File.stat("/usr/bin/ruby")
s.file?             # => true
s.directory?        # => false
s.ftype             # => "file"
s.readable?         # => true
s.writable?         # => false
s.executable?       # => true
s.size              # => 5492
s.atime             # => Mon Jul 23 13:20:37 -0700 2007
---------------------------
# Testing single files
test ?e, "/usr/bin/ruby"   # File.exist?("/usr/bin/ruby")
test ?f, "/usr/bin/ruby"   # File.file?("/usr/bin/ruby")
test ?d, "/usr/bin/ruby"   # File.directory?("/usr/bin/ruby")
test ?r, "/usr/bin/ruby"   # File.readable?("/usr/bin/ruby")
test ?w, "/usr/bin/ruby"   # File.writeable?("/usr/bin/ruby")
test ?M, "/usr/bin/ruby"   # File.mtime("/usr/bin/ruby")
test ?s, "/usr/bin/ruby"   # File.size?("/usr/bin/ruby")

# Comparing two files f and g
test ?-, f, g              # File.identical(f,g)
test ?<, f, g              # File(f).mtime < File(g).mtime
test ?>, f, g              # File(f).mtime > File(g).mtime
test ?=, f, g              # File(f).mtime == File(g).mtime
---------------------------
# Create (or overwrite) a file named "test"
File.open("test", "w") {}
# Create (but do not clobber) a file named "test"
File.open("test", "a") {}
---------------------------
File.rename("test", "test.old")     # Current name, then new name
---------------------------
File.symlink("test.old", "oldtest") # Link target, link name
---------------------------
File.link("test.old", "test2")   # Link target, link name
---------------------------
File.delete("test2")   # May also be called with multiple args
File.unlink("oldtest") # to delete multiple named files
---------------------------
f = "log.messages"          # Filename
atime = mtime = Time.now    # New access and modify times
File.truncate(f, 0)         # Erase all existing content
File.utime(atime, mtime, f) # Change times
File.chmod(0600, f)         # Unix permissions -rw-------; note octal arg
---------------------------
Dir.mkdir("temp")                 # Create a directory
File.open("temp/f", "w") {}       # Create a file in it
File.open("temp/g", "w") {}       # Create another one
File.delete(*Dir["temp/*"])       # Delete all files in the directory
Dir.rmdir("temp")                 # Delete the directory
---------------------------
f = File.open("data.txt", "r")   # Open file data.txt for reading
out = File.open("out.txt", "w")  # Open file out.txt for writing
---------------------------
File.open("log.txt", "a") do |log|      # Open for appending
  log.puts("INFO: Logging a message")   # Output to the file
end                                     # Automatically closed
---------------------------
# How long has the server been up?
uptime = open("|uptime") {|f| f.gets }
---------------------------
require "open-uri"                         # Required library
f = open("http://www.davidflanagan.com/")  # Webpage as a file
webpage = f.read                           # Read it as one big string
f.close                                    # Don't forget to close!
---------------------------
require "stringio"
input = StringIO.open("now is the time")  # Read from this string
buffer = ""
output = StringIO.open(buffer, "w")       # Write into buffer
---------------------------
f.set_encoding("iso-8859-1", "utf-8") # Latin-1, transcoded to UTF-8
f.set_encoding("iso-8859-1:utf-8")    # Same as above
f.set_encoding(Encoding::UTF-8)       # UTF-8 text
---------------------------
in = File.open("data.txt", "r:utf-8");           # Read UTF-8 text
out = File.open("log", "a:utf-8");               # Write UTF-8 text
in = File.open("data.txt", "r:iso8859-1:utf-8"); # Latin-1 transcoded to UTF-8 ---------------------------
File.open("data", "r:binary")  # Open a file for reading binary data</programlisting>

      <para>On Windows, you should open binary files with mode <literal role="keep-together">"rb:binary"</literal> or call <literal role="keep-together">binmode</literal> <indexterm>
          <primary>binmode method (IO)</primary>
        </indexterm>on the stream. This disables the automatic newline
      conversion performed by Windows, and is only necessary on that
      platform.</para>

      <para>Not every stream-reading method honors the encoding of a stream.
      Some lower-level reading methods take an argument that specifies the
      number of bytes to read. By their nature, these methods return unencoded
      strings of bytes rather than strings of text. The methods that do not
      specify a length to read do honor the encoding.</para>
    </sect2>

    <sect2>
      <title>Reading from a Stream</title>

      <para>The <literal>IO</literal> class<indexterm class="startofrange" id="ch09-streams">
          <primary>streams</primary>

          <secondary>reading from</secondary>
        </indexterm> defines a number of methods for reading from streams.
      They work only if the stream is readable, of course. You can read
      <indexterm>
          <primary>STDIN stream</primary>
        </indexterm><indexterm>
          <primary>ARGF stream</primary>
        </indexterm><indexterm>
          <primary>DATA stream</primary>
        </indexterm><indexterm>
          <primary>STDOUT stream</primary>
        </indexterm><indexterm>
          <primary>STDERR stream</primary>
        </indexterm>from <literal>STDIN</literal>, <literal>ARGF</literal>,
      and <literal>DATA</literal>, but not from <literal>STDOUT</literal> or
      <literal>STDERR</literal>. Files and <literal>StringIO</literal> objects
      are opened for reading by default, unless you explicitly open them for
      writing only.</para>

      <sect3 id="readinglines">
        <title>Reading lines</title>

        <para><literal>IO</literal> defines a number of ways to read lines
        from a stream:</para>

        <programlisting>lines = ARGF.readlines         # Read all input, return an array of lines
line = DATA.readline           # Read one line from stream
print l while l = DATA.gets    # Read until gets returns nil, at EOF
DATA.each {|line| print line } # Iterate lines from stream until EOF
DATA.each_line                 # An alias for each
DATA.lines                     # An enumerator for each_line: Ruby 1.9
---------------------------
print while DATA.gets
---------------------------
DATA.lineno = 0     # Start from line 0, even though data is at end of file
DATA.readline       # Read one line of data
DATA.lineno         # => 1
$.                  # => 1: magic global variable, implicitly set
---------------------------
data = IO.read("data")         # Read and return the entire file
data = IO.read("data", 4, 2)   # Read 4 bytes starting at byte 2
data = IO.read("data", nil, 6) # Read from byte 6 to end-of-file

# Read lines into an array
words = IO.readlines("/usr/share/dict/words")

# Read lines one at a time and initialize a hash
words = {}
IO.foreach("/usr/share/dict/words") {|w| words[w] = true}
---------------------------
# An alternative to text = File.read("data.txt")
f = File.open("data.txt")  # Open a file
text = f.read              # Read its contents as text
f.close                    # Close the file
---------------------------
f = File.open("data", "r:binary") # Open data file for binary reads 
c = f.getc                        # Read the first byte as an integer
f.ungetc(c)                       # Push that byte back
c = f.readchar                    # Read it back again
---------------------------
f.each_byte {|b| ... }      # Iterate through remaining bytes
f.bytes                     # An enumerator for each_byte: Ruby 1.9
---------------------------
f = File.open("data.bin", "rb:binary")  # No newline conversion, no encoding
magic = f.readbytes(4)       # First four bytes identify filetype
exit unless magic == "INTS"  # Magic number spells "INTS" (ASCII)
bytes = f.read               # Read the rest of the file
                             # Encoding is binary, so this is a byte string
data = bytes.unpack("i*")    # Convert bytes to an array of integers
---------------------------
o = STDOUT
# Single-character output
o.putc(65)         # Write single byte 65 (capital A)
o.putc("B")        # Write single byte 66 (capital B)
o.putc("CD")       # Write just the first byte of the string
---------------------------
o = STDOUT
# String output
o << x             # Output x.to_s 
o << x << y        # May be chained: output x.to_s + y.to_s
o.print            # Output $_ + $\
o.print s          # Output s.to_s + $\
o.print s,t        # Output s.to_s + t.to_s + $\
o.printf fmt,*args # Outputs fmt%[args]
o.puts             # Output newline
o.puts x           # Output x.to_s.chomp plus newline
o.puts x,y         # Output x.to_s.chomp, newline, y.to_s.chomp, newline
o.puts [x,y]       # Same as above
o.write s          # Output s.to_s, returns s.to_s.length
o.syswrite s       # Low-level version of write
---------------------------
f = File.open("test.txt")
f.pos        # => 0: return the current position in bytes
f.pos = 10   # skip to position 10
f.tell       # => 10: a synonym for pos
f.rewind     # go back to position 0, reset lineno to 0, also
f.seek(10, IO::SEEK_SET)  # Skip to absolute position 10
f.seek(10, IO::SEEK_CUR)  # Skip 10 bytes from current position
f.seek(-10, IO::SEEK_END) # Skip to 10 bytes from end
f.seek(0, IO::SEEK_END)   # Skip to very end of file
f.eof?                    # => true: we're at the end
---------------------------
pos = f.sysseek(0, IO::SEEK_CUR)  # Get current position
f.sysseek(0, IO::SEEK_SET)        # Rewind stream
f.sysseek(pos, IO::SEEK_SET)      # Return to original position
---------------------------
File.open("test.txt") do |f|
  # Use stream f here
  # Value of this block becomes return value of the open method
end # f is automatically closed for us here
---------------------------
begin
  f = File.open("test.txt")
  # use stream f here
ensure
  f.close if f
end
---------------------------
out.print 'wait>' # Display a prompt
out.flush         # Manually flush output buffer to OS
sleep(1)          # Prompt appears before we go to sleep

out.sync = true   # Automatically flush buffer after every write
out.sync = false  # Don't automatically flush
out.sync          # Return current sync mode
out.fsync         # Flush output buffer and ask OS to flush its buffers
                  # Returns nil if unsupported on current platform
---------------------------
f.eof?       # true if stream is at EOF
f.closed?    # true if stream has been closed
f.tty?       # true if stream is interactive
---------------------------
require 'socket'
---------------------------
require 'socket'                # Sockets are in standard library

host, port = ARGV               # Host and port from command line

s = TCPSocket.open(host, port)  # Open a socket to host and port
while line = s.gets             # Read lines from the socket
  puts line.chop                # And print with platform line terminator
end
s.close                         # Close the socket when done
---------------------------
require 'socket'                  
host, port = ARGV                 
TCPSocket.open(host, port) do |s| # Use block form of open
  while line = s.gets             
    puts line.chop                
  end
end                               # Socket automatically closed
---------------------------
require 'socket'               # Get sockets from stdlib

server = TCPServer.open(2000)  # Socket to listen on port 2000
loop {                         # Infinite loop: servers run forever
  client = server.accept       # Wait for a client to connect
  client.puts(Time.now.ctime)  # Send the time to the client
  client.close                 # Disconnect from the client
}
---------------------------
ruby client.rb localhost 2000
---------------------------
require 'socket'                     # Standard library

host, port, request = ARGV           # Get args from command line

ds = UDPSocket.new                   # Create datagram socket
ds.connect(host, port)               # Connect to the port on the host
ds.send(request, 0)                  # Send the request text
response,address = ds.recvfrom(1024) # Wait for a response (1kb max)
puts response                        # Print the response
---------------------------
require 'socket'                     # Standard library

port = ARGV[0]                       # The port to listen on

ds = UDPSocket.new                   # Create new socket
ds.bind(nil, port)                   # Make it listen on the port
loop do                              # Loop forever
  request,address=ds.recvfrom(1024)  # Wait to receive something
  response = request.upcase          # Convert request text to uppercase
  clientaddr = address[3]            # What ip address sent the request?
  clientname = address[2]            # What is the host name?
  clientport = address[1]            # What port was it sent from
  ds.send(response, 0,               # Send the response back...
          clientaddr, clientport)    # ...where it came from
  # Log the client connection
  puts "Connection from: #{clientname} #{clientaddr} #{clientport}"
end
---------------------------
require 'socket'     # Sockets from standard library

host, port = ARGV    # Network host and port on command line

begin                # Begin for exception handling
  # Give the user some feedback while connecting.
  STDOUT.print "Connecting..."      # Say what we're doing
  STDOUT.flush                      # Make it visible right away
  s = TCPSocket.open(host, port)    # Connect
  STDOUT.puts "done"                # And say we did it

  # Now display information about the connection.
  local, peer = s.addr, s.peeraddr
  STDOUT.print "Connected to #{peer[2]}:#{peer[1]}"
  STDOUT.puts " using local port #{local[1]}"

  # Wait just a bit, to see if the server sends any initial message.
  begin
    sleep(0.5)                      # Wait half a second
    msg = s.read_nonblock(4096)     # Read whatever is ready
    STDOUT.puts msg.chop            # And display it
  rescue SystemCallError
    # If nothing was ready to read, just ignore the exception.
  end

  # Now begin a loop of client/server interaction.
  loop do
    STDOUT.print '> '   # Display prompt for local input
    STDOUT.flush        # Make sure the prompt is visible
    local = STDIN.gets  # Read line from the console
    break if !local     # Quit if no input from console

    s.puts(local)       # Send the line to the server
    s.flush             # Force it out

    # Read the server's response and print out.
    # The server may send more than one line, so use readpartial
    # to read whatever it sends (as long as it all arrives in one chunk).
    response = s.readpartial(4096) # Read server's response
    puts(response.chop)            # Display response to user
  end
rescue           # If anything goes wrong
  puts $!        # Display the exception to the user
ensure           # And no matter what happens
  s.close if s   # Don't forget to close the socket
end
---------------------------
# This server reads a line of input from a client, reverses
# the line and sends it back. If the client sends the string "quit"
# it disconnects. It uses Kernel.select to handle multiple sessions.

require 'socket'           

server = TCPServer.open(2000) # Listen on port 2000
sockets = [server]            # An array of sockets we'll monitor
log = STDOUT                  # Send log messages to standard out
while true                    # Servers loop forever
  ready = select(sockets)     # Wait for a socket to be ready
  readable = ready[0]         # These sockets are readable

  readable.each do |socket|         # Loop through readable sockets
    if socket == server             # If the server socket is ready
      client = server.accept        # Accept a new client
      sockets << client             # Add it to the set of sockets
      # Tell the client what and where it has connected.
      client.puts "Reversal service v0.01 running on #{Socket.gethostname}"
      # And log the fact that the client connected
      log.puts "Accepted connection from #{client.peeraddr[2]}"
    else                            # Otherwise, a client is ready
      input = socket.gets           # Read input from the client

      # If no input, the client has disconnected
      if !input   
        log.puts "Client on #{socket.peeraddr[2]} disconnected."
        sockets.delete(socket)      # Stop monitoring this socket
        socket.close                # Close it
        next                        # And go on to the next
      end

      input.chop!                   # Trim client's input
      if (input == "quit")          # If the client asks to quit
        socket.puts("Bye!");        # Say goodbye
        log.puts "Closing connection to #{socket.peeraddr[2]}"
        sockets.delete(socket)      # Stop monitoring the socket
        socket.close                # Terminate the session
      else                          # Otherwise, client is not quitting
        socket.puts(input.reverse)  # So reverse input and send it back
      end
    end
  end
end
---------------------------
require 'socket'           # We need sockets
 
host = 'www.example.com'   # The web server
port = 80                  # Default HTTP port
path = "/index.html"       # The file we want 

# This is the HTTP request we send to fetch a file
request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Read complete response
# Split response at first blank line into headers and body
headers,body = response.split("\r\n\r\n", 2) 
print body                          # And display it
---------------------------
require 'net/http'         # The library we need
host = 'www.example.com'   # The web server
path = '/index.html'       # The file we want 

http = Net::HTTP.new(host)      # Create a connection
headers, body = http.get(path)  # Request the file
if headers.code == "200"        # Check the status code   
                                # NOTE: code is not a number!
  print body                    # Print body if we got it
else                            # Otherwise
  puts "#{headers.code} #{headers.message}" # Display error message
end
---------------------------
require 'open-uri'
open("http://www.example.com/index.html") {|f|
  puts f.read
}
---------------------------
# Thread #1 is running here
Thread.new {
  # Thread #2 runs this code
}
# Thread #1 runs this code
---------------------------
# Wait for all threads (other than the current thread and
# main thread) to stop running.
# Assumes that no new threads are started while waiting.
def join_all
  main = Thread.main        # The main thread
  current = Thread.current  # The current thread
  all = Thread.list         # All threads still running
  # Now call join on each thread
  all.each {|t| t.join unless t == current or t == main }
end
---------------------------
Thread.abort_on_exception = true
---------------------------
t = Thread.new { ... }
t.abort_on_exception = true
---------------------------
x = 0

t1 = Thread.new do
  # This thread can query and set the variable x
end

t2 = Thread.new do
  # This thread and also query and set x
  # And it can query and set t1 and t2 as well.   
end
---------------------------
n = 1
while n <= 3
  Thread.new { puts n }
  n += 1
end 
---------------------------
n = 1
while n <= 3
  # Get a private copy of the current value of n in x
  Thread.new(n) {|x| puts x }
  n += 1
end 
---------------------------
1.upto(3) {|n| Thread.new { puts n }}
---------------------------
Thread.current[:progress] = bytes_received
---------------------------
total = 0
download_threads.each {|t| total += t[:progress] }
---------------------------
total = 0
download_threads.each {|t| total += t[:progress] if t.key?(:progress)}
---------------------------
group = ThreadGroup.new
3.times {|n| group.add(Thread.new { do_task(n) }}
---------------------------
# Read files concurrently. Use with the "open-uri" module to fetch URLs.
# Pass an array of filenames. Returns a hash mapping filenames to content.
def conread(filenames)
  h = {}                            # Empty hash of results

  # Create one thread for each file
  filenames.each do |filename|      # For each named file
    h[filename] = Thread.new do     # Create a thread, map to filename
      open(filename) {|f| f.read }  # Open and read the file
    end                             # Thread value is file contents
  end

  # Iterate through the hash, waiting for each thread to complete.
  # Replace the thread in the hash with its value (the file contents)
  h.each_pair do |filename, thread| 
    begin
      h[filename] = thread.value    # Map filename to file contents
    rescue
      h[filename] = $!              # Or to the exception raised
    end
  end
end
---------------------------
require 'socket'

# This method expects a socket connected to a client.
# It reads lines from the client, reverses them and sends them back.
# Multiple threads may run this method at the same time.
def handle_client(c)
  while true
    input = c.gets.chop     # Read a line of input from the client
    break if !input         # Exit if no more input
    break if input=="quit"  # or if the client asks to.
    c.puts(input.reverse)   # Otherwise, respond to client.
    c.flush                 # Force our output out
  end
  c.close                   # Close the client socket
end


server = TCPServer.open(2000) # Listen on port 2000

while true                    # Servers loop forever
  client = server.accept      # Wait for a client to connect
  Thread.start(client) do |c| # Start a new thread 
    handle_client(c)          # And handle the client on that thread
  end
end
---------------------------
module Enumerable           # Open the Enumerable module
  def conmap(&block)        # Define a new method that expects a block
    threads = []            # Start with an empty array of threads
    self.each do |item|     # For each enumerable item
      # Invoke the block in a new thread, and remember the thread
      threads << Thread.new { block.call(item) }
    end
    # Now map the array of threads to their values 
    threads.map {|t| t.value } # And return the array of values
  end
end
---------------------------
module Enumerable
  def concurrently
    map {|item| Thread.new { yield item }}.each {|t| t.join }
  end
end
---------------------------
h.each_pair.concurrently {|*pair| process(pair)}
---------------------------
require 'thread'  # For Mutex class in Ruby 1.8

# A BankAccount has a name, a checking amount, and a savings amount.
class BankAccount
  def init(name, checking, savings)
    @name,@checking,@savings = name,checking,savings 
    @lock = Mutex.new         # For thread safety
  end

  # Lock account and transfer money from savings to checking
  def transfer_from_savings(x)
    @lock.synchronize {
      @savings -= x
      @checking += x
    }
  end

  # Lock account and report current balances
  def report
    @lock.synchronize {
      "#@name\nChecking: #@checking\nSavings: #@savings"
    }
  end
end
---------------------------
# Classic deadlock: two threads and two locks
require 'thread'

m,n = Mutex.new, Mutex.new

t = Thread.new {
  m.lock
  puts "Thread t locked Mutex m"
  sleep 1
  puts "Thread t waiting to lock Mutex n"
  n.lock
}

s = Thread.new {
  n.lock
  puts "Thread s locked Mutex n"
  sleep 1
  puts "Thread s waiting to lock Mutex m"
  m.lock
}

t.join
s.join
---------------------------
a = [-2,-1,0,1,2]
mapper = lambda {|x| x*x }             # Compute squares
injector = lambda {|total,x| total+x } # Compute sum
a.conject(0, mapper, injector)         # => 10
---------------------------
module Enumerable
  # Concurrent inject: expects an initial value and two Procs
  def conject(initial, mapper, injector)
    # Use a Queue to pass values from mapping threads to injector thread
    q = Queue.new   
    count = 0                 # How many items?
    each do |item|            # For each item
      Thread.new do           # Create a new thread
        q.enq(mapper[item])   # Map and enqueue mapped value
      end
      count += 1              # Count items
    end

    t = Thread.new do         # Create injector thread
      x = initial             # Start with specified initial value
      while(count > 0)        # Loop once for each item
        x = injector[x,q.deq] # Dequeue value and inject
        count -= 1            # Count down
      end
      x                       # Thread value is injected value
    end

    t.value   # Wait for injector thread and return its value
  end
end
---------------------------
require 'thread'

class Exchanger
  def initialize
    # These variables will hold the two values to be exchanged.
    @first_value = @second_value = nil
    # This Mutex protects access to the exchange method.
    @lock = Mutex.new
    # This Mutex allows us to determine whether we're the first or
    # second thread to call exchange.
    @first = Mutex.new
    # This ConditionVariable allows the first thread to wait for
    # the arrival of the second thread.
    @second = ConditionVariable.new
  end

  # Exchange this value for the value passed by the other thread.
  def exchange(value)
    @lock.synchronize do      # Only one thread can call this method at a time
      if @first.try_lock      # We are the first thread
        @first_value = value  # Store the first thread's argument
        # Now wait until the second thread arrives.
        # This temporarily unlocks the Mutex while we wait, so 
        # that the second thread can call this method, too
        @second.wait(@lock)   # Wait for second thread 
        @first.unlock         # Get ready for the next exchange
        @second_value         # Return the second thread's value
      else                    # Otherwise, we're the second thread
        @second_value = value # Store the second value
        @second.signal        # Tell the first thread we're here
        @first_value          # Return the first thread's value
      end
    end
  end
end
---------------------------
