#!/usr/bin/ruby
# Print the library version of libpg which links the postgresql DB through a C library

require 'pg'

puts 'Version of libpg: ' + PG.library_version.to_s