#!/usr/bin/env ruby
#
#   

__END__

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
