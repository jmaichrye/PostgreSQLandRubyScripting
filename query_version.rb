#!/usr/bin/ruby
# Prints out PostgreSQL version version

require 'pg'

begin

  con = PG.connect host: 'localhost', :dbname => 'DBName', :user => 'Username',
                   :password => 'YourPasswordHere'

  rs = con.exec 'SELECT VERSION()'
  puts rs.getvalue 0, 0

rescue PG::Error => e

  puts e.message

ensure

  con.close if con

end