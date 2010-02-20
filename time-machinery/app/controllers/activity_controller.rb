require "mongo"

class ActivityController < ApplicationController

  def create
    
    colFoo = connetion()
    colFoo.insert("name" => params["activity_name"])

    render :text => "done"
  end

  def list
    
    colFoo = connection()
    
    document = ""
    colFoo.find("name" => /.*/).each { |doc|
      
      document << doc["name"]
      document << "<br/>"
    }
    
    render :text => "Read back verification #{document}"
  end

  private

  def connection

    m = Mongo::Connection.new
    db = m.db("foo")
    db["foo"]
  end
    
end
