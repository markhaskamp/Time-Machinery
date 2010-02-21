require 'mongo'

class Activity_Controller

  def self.createActivity(paramHash)
    m = Mongo::Connection.new
    db = m.db("foo")
    colFoo = db["foo"]

    colFoo.insert("name" => paramHash["activity_name"])
  end

  def self.showList params
    m = Mongo::Connection.new
    db = m.db("foo")
    colln = db["foo"]
    
    document = ""
    colln.find("name" => /.*/).each { |doc|
      
      document << "&nbsp;-&nbsp; #{doc["name"]}<br/>"
    }
    return "Read back verification<br />#{document}"
  end
end
