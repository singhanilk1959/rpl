#!/usr/bin/env ruby

# optparse.rb - command-line option analysis with the OptionParser class.
#
# Author:: Nobu Nakada
# Documentation:: Nobu Nakada and Gavin Sinclair.
#
# See OptionParser for documentation.
#


# == Developer Documentation (not for RDoc output)
#
# === Class tree
#
# - OptionParser:: front end
# - OptionParser::Switch:: each switches
# - OptionParser::List:: options list
# - OptionParser::ParseError:: errors on parsing
#   - OptionParser::AmbiguousOption
#   - OptionParser::NeedlessArgument
#   - OptionParser::MissingArgument
#   - OptionParser::InvalidOption
#   - OptionParser::InvalidArgument
#     - OptionParser::AmbiguousArgument
#
# === Object relationship diagram
#
#   +--------------+
#   | OptionParser |<>-----+
#   +--------------+       |                      +--------+
#                          |                    ,-| Switch |
#        on_head -------->+---------------+    /  +--------+
#        accept/reject -->| List          |<|>-
#                         |               |<|>-  +----------+
#        on ------------->+---------------+    `-| argument |
#                           :           :        |  class   |
#                         +---------------+      |==========|
#        on_tail -------->|               |      |pattern   |
#                         +---------------+      |----------|
#   OptionParser.accept ->| DefaultList   |      |converter |
#                reject   |(shared between|      +----------+
#                         | all instances)|
#                         +---------------+
#
# == OptionParser
#
# === Introduction
#
# OptionParser is a class for command-line option analysis.  It is much more
# advanced, yet also easier to use, than GetoptLong, and is a more Ruby-oriented
# solution.
#
# === Features
#
# 1. The argument specification and the code to handle it are written in the
#    same place.
# 2. It can output an option summary; you don't need to maintain this string
#    separately.
# 3. Optional and mandatory arguments are specified very gracefully.
# 4. Arguments can be automatically converted to a specified class.
# 5. Arguments can be restricted to a certain set.
#
# All of these features are demonstrated in the examples below.
#
# === Minimal example
#
#   require 'optparse'
#
#   options = {}
#   OptionParser.new do |opts|
#     opts.banner = "Usage: example.rb [options]"
#
#     opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
#       options[:verbose] = v
#     end
#   end.parse!
#
#   p options
#   p ARGV
#
# === Complete example
#
# The following example is a complete Ruby program.  You can run it and see the
# effect of specifying various options.  This is probably the best way to learn
# the features of +optparse+.

   require 'optparse'
   require 'optparse/time'
   require 'ostruct'
   require 'pp'

   class OptparseExample

     CODES = %w[iso-2022-jp shift_jis euc-jp utf8 binary]
     CODE_ALIASES = { "jis" => "iso-2022-jp", "sjis" => "shift_jis" }

     #
     # Return a structure describing the options.
     #
     def self.parse(args)
       # The options specified on the command line will be collected in *options*.
       # We set default values here.
       options = OpenStruct.new
       options.library = []
       options.inplace = false
       options.encoding = "utf8"
       options.transfer_type = :auto
       options.verbose = false

       opts = OptionParser.new do |opts|
         opts.banner = "Usage: example.rb [options]"

         opts.separator ""
         opts.separator "Specific options:"

         # Mandatory argument.
         opts.on("-r", "--require LIBRARY",
                 "Require the LIBRARY before executing your script") do |lib|
           options.library << lib
        end

         # Optional argument; multi-line description.
         opts.on("-i", "--inplace [EXTENSION]",
                 "Edit ARGV files in place",
                 "  (make backup if EXTENSION supplied)") do |ext|
           options.inplace = true
           options.extension = ext || ''
           options.extension.sub!(/\A\.?(?=.)/, ".")  # Ensure extension begins with dot.
         end

         # Cast 'delay' argument to a Float.
         opts.on("--delay N", Float, "Delay N seconds before executing") do |n|
           options.delay = n
         end

         # Cast 'time' argument to a Time object.
         opts.on("-t", "--time [TIME]", Time, "Begin execution at given time") do |time|
           options.time = time
         end

         # Cast to octal integer.
         opts.on("-F", "--irs [OCTAL]", OptionParser::OctalInteger,
                 "Specify record separator (default \\0)") do |rs|
           options.record_separator = rs
         end

         # List of arguments.
         opts.on("--list x,y,z", Array, "Example 'list' of arguments") do |list|
           options.list = list
         end

         # Keyword completion.  We are specifying a specific set of arguments (CODES
         # and CODE_ALIASES - notice the latter is a Hash), and the user may provide
         # the shortest unambiguous text.
         code_list = (CODE_ALIASES.keys + CODES).join(',')
         opts.on("--code CODE", CODES, CODE_ALIASES, "Select encoding",
                 "  (#{code_list})") do |encoding|
           options.encoding = encoding
         end

         # Optional argument with keyword completion.
         opts.on("--type [TYPE]", [:text, :binary, :auto],
                 "Select transfer type (text, binary, auto)") do |t|
           options.transfer_type = t
         end

         # Boolean switch.
         opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
           options.verbose = v
         end

         opts.separator ""
         opts.separator "Common options:"

         # No argument, shows at tail.  This will print an options summary.
         # Try it and see!
         opts.on_tail("-h", "--help", "Show this message") do
           puts opts
           exit!
         end

         # Another typical switch to print the version.
         opts.on_tail("--version", "Show version") do
           puts OptionParser::Version.join('.')
           exit!
         end
       end
       begin
        puts " I am here"
       	opts.parse!(args)
        puts " I am here1"
       rescue Exception => ex
        puts " I am hereex"
        puts ex
         puts opts.to_s
         exit!
       end
        puts " I am here2"
       options
     end  # parse()

   end  # class OptparseExample

 

puts "******"
puts ARGV

   options = OptparseExample.parse(ARGV)
   puts " I am here3"

   puts options.to_s
   pp options

# === Further documentation
#
# The above examples should be enough to learn how to use this class.  If you
# have any questions, email me (gsinclair@soyabean.com.au) and I will update
# this document.
#
