#!/usr/bin/env ruby
#
#   

__END__

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
