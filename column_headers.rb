#!/usr/bin/ruby
# Program to print the column headers of the Cars table

require 'pg'

begin

  con = PG.connect host: 'localhost', :dbname => 'DBName', :user => 'Username',
                   :password => 'YourPasswordHere'

  rs = con.exec 'SELECT * FROM Cars WHERE Id=0'
  puts 'There are %d columns ' % rs.nfields
  puts 'The column names are:'
  puts rs.fields

rescue PG::Error => e

  puts e.message

ensure

  rs.clear if rs
  con.close if con

end