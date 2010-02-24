require 'mongo'

class Activity_Controller

  def self.createActivity(paramHash)

    dbSetup { |collection|
      collection.insert("name" => paramHash["activity_name"])
    }

  end

  def self.showList params
    
    document = ""
    dbSetup { |collection|
      collection.find("name" => /.*/).each { |doc|
        document << "&nbsp;-&nbsp; #{doc["name"]}<br/>"
      }
    }
    return "Read back verification<br />#{document}"
  end

  def self.newlist params
    
    json = '['
    leadingComma = ''

    dbSetup { |collection|
      collection.find("name" => /.*/).each { |doc|
        json += sprintf("%s{\"name\": \"%s\"}\n", leadingComma, doc["name"]);
        leadingComma = ','
      }
    }
    json += ']'
    return json.to_a
  end

  def self.names params
    
    json = '['
    leadingComma = ''

    dbSetup { |collection|
      collection.find("name" => /.*/).each { |doc|
        json += sprintf("%s{\"name\": \"%s\"}\n", leadingComma, doc["name"]);
        leadingComma = ','
      }
    }
    json += ']'
    return json.to_a
  end

  private 

  def self.dbSetup

    mongoConnection = Mongo::Connection.new
    database = mongoConnection.db("foo")
    
    yield database["foo"]

    mongoConnection.close
  end
end
