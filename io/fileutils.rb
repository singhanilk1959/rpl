#!/usr/bin/env ruby
#
#
puts `cat fileutils.rb`
require 'fileutils'
include FileUtils::Verbose

cd('/tmp') do
	p pwd
        cp "/etc/passwd", "tmp_passwd"
end
p Dir.pwd


