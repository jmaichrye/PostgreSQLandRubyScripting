#!/usr/bin/ruby
# Prints server version

require 'pg'

begin

  con = PG.connect host: 'localhost', :dbname => 'DBName', :user => 'Username',
                   :password => 'YourPasswordHere'

  puts con.server_version

rescue PG::Error => e

  puts e.message

ensure

  con.close if con

end