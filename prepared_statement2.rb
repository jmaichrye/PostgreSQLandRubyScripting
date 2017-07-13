#!/usr/bin/ruby
# prints out saved values

require 'pg'

begin

  con = PG.connect host: 'localhost', :dbname => 'DBName', :user => 'Username',
                   :password => 'YourPasswordHere'

  stm = "SELECT $1::int AS a, $2::int AS b, $3::int AS c"
  rs = con.exec_params(stm, [1, 2, 3])

  puts rs.values

rescue PG::Error => e

  puts e.message

ensure

  rs.clear if rs
  con.close if con

end