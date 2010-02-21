require 'rubygems'
require 'sinatra'
require 'mongo'

get '/' do
  erb :index
end

get '/create' do
  
  colFoo = connection()
  colFoo.insert("name" => params["activity_name"])
  "created at #{Time.now} <br />activity_name: #{params['activity_name']}"
end


get '/list' do
    
  colFoo = connection()
    
  document = ""
  colFoo.find("name" => /.*/).each { |doc|
      
    document << "&nbsp;-&nbsp; #{doc["name"]}<br/>"
  }
    
  "Read back verification<br />#{document}"
end

def connection

  m = Mongo::Connection.new
  db = m.db("foo")
  db["foo"]
end
    
