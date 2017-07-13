#!/usr/bin/ruby
# Prints out the username, DBname, and password

require 'pg'

begin

  con = PG.connect host: 'localhost', :dbname => 'DBName', :user => 'Username',
                   :password => 'YourPasswordHere'

  user = con.user
  db_name = con.db
  pswd = con.pass

  puts "User: #{user}"
  puts "Database name: #{db_name}"
  puts "Password: #{pswd}"



rescue PG::Error => e

  puts e.message

ensure

  con.close if con

end