require 'rubygems'
require 'mongo'


def measure(label)

  m = Mongo::Connection.new
  db = m.db("long_document")
  long_doc = db["long_document"]
  
  start = Time.new
  
  yield long_doc

  puts "#{label}: #{Time.new - start}"
  
  m.close
end

#
# Drop the collection
#
measure("drop") { |col|
  
  col.drop
}

#
# Small row
#
measure("insert small") { |col|
  
  data = ""
  10.times { data << "X" }
  
  col.insert("small_row" => data)
}

#
# Long row
#
measure("insert long") { |col|
  
  data = ""
  100000.times { data << "X" }
  
  col.insert("long_row" => data)
}

#
# read small row
#
measure("read small") { |col|
   
  col.find_one("small_row" => /.*/)
}

#
# read small row
#
measure("read long") { |col|
   
  col.find_one("long_row" => /.*/)
}





