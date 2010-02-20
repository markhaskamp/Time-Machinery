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

measure("drop") { |col|
  
  col.drop
}

measure("insert many") { |col|
  
  100000.times { |count|
    col.insert("rows" => count)
  }
}

measure("read one 1") { |col|
   
  col.find("rows" => /1/)
}

measure("read one 9999") { |col|
   
  col.find("rows" => /9999/)
}

measure("read many") { |col|
   
  col.find("rows" => /.*/)
}

measure("read one with count") { |col|
   
  col.find("rows" => /1/).count()
}

measure("read many with count") { |col|
   
  col.find("rows" => /.*/).count()
}





