#!/usr/bin/env ruby
#
#******************
out = `cat  sh12.rb` ; puts out ;

require 'trollop'

## Here's a program called "magic". We want this behavior:
##
##   magic delete <fn> => deletes a file
##   magic copy <fn>   => copies a file
##
## So 'delete' and 'copy' are subcommands.
##
## There are some global options, which appear to the left of the subcommand.
## There are some subcommand options, which appear to the right.
##
## Subcommand options can be specific to the subcommand. 'delete' might take
## different options from 'copy'.
##
## We do this by calling Trollop twice; one for the global options and once for
## the subcommand options. We need to tell Trollop what the subcommands are, so
## that it stops processing the global options when it encounters one of them.

SUB_COMMANDS = %w(delete copy)
global_opts = Trollop::options do
  banner "magic file deleting and copying utility"
  opt :dry_run, "Don't actually do anything", :short => "-n"
  stop_on SUB_COMMANDS
end

cmd = ARGV.shift # get the subcommand
cmd_opts = case cmd
  when "delete" # parse delete options
    Trollop::options do
      opt :force, "Force deletion"
    end
  when "copy"  # parse copy options
    Trollop::options do
      opt :double, "Copy twice for safety's sake"
    end
  else
    Trollop::die "unknown subcommand #{cmd.inspect}"
  end

puts "Global options: #{global_opts.inspect}"
puts "Subcommand: #{cmd.inspect}"
puts "Subcommand options: #{cmd_opts.inspect}"
puts "Remaining arguments: #{ARGV.inspect}"
