#!/usr/bin/env ruby
# you can obtain the complete list of global variables predefined by Ruby
# ruby -e 'puts global_variables.sort '
# To include verbose names
print %%
puts "Global Variables"
gv =` ruby  -e 'puts global_variables.sort' `
print "Global Variables\n"
print gv
print "Global Variables\n"
gv =` ruby -rEnglish -e 'puts global_variables.sort' `
%
puts "Global Variables"
gv =` ruby  -e 'puts global_variables.sort' `
print "Global Variables\n"
print gv
print "Global Variables\n"
gv =` ruby -rEnglish -e 'puts global_variables.sort' `
print gv

gets

#
# Top level constants
#
print %%
print "Global Constants\n"

gc =` ruby -e 'puts Module.constants.sort.reject{|x| eval(x.to_s).is_a? Module}' `
print gc
%
print "Global Constants\n"

gc =` ruby -e 'puts Module.constants.sort.reject{|x| eval(x.to_s).is_a? Module}' `
print gc



print ARGF.argv

require "English"

print $ARGV

print $FS ; print $;
