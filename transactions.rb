#!/usr/bin/ruby
# Executes transactions within the DB  updates a record and inserts a new one

require 'pg'

begin

  con = PG.connect host: 'localhost', :dbname => 'DBName', :user => 'Username',
                   :password => 'YourPasswordHere'

  con.transaction do |con|

    con.exec "UPDATE Cars SET Price=23700 WHERE Id=8"
    con.exec "INSERT INTO Cars VALUES(9,'Mazda',27770)"

  end

rescue PG::Error => e

  puts e.message

ensure

  con.close if con

end