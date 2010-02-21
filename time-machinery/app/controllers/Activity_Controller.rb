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


  private 

  def self.dbSetup

    mongoConnection = Mongo::Connection.new
    database = mongoConnection.db("foo")
    
    yield database["foo"]

    mongoConnection.close
  end
end
