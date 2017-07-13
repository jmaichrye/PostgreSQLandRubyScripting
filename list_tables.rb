#!/usr/bin/ruby
# Print all table names from a given DB

require 'pg'

begin

  con = PG.connect host: 'localhost', :dbname => 'DBName', :user => 'Username',
                   :password => 'YourPasswordHere'

  rs = con.exec "SELECT table_name FROM information_schema.tables
        WHERE table_schema = 'public'"

  rs.each do |row|
    puts row['table_name']
  end

rescue PG::Error => e

  puts e.message

ensure

  rs.clear if rs
  con.close if con

end