require 'rubygems'
require 'sinatra'
require 'mongo'
require 'controllers/Activity_Controller.rb'

get '/' do
  erb :index
end

get '/create' do

  Activity_Controller.createActivity params
  "created at #{Time.now} <br />activity_name: #{params['activity_name']}"
end


get '/list' do

  Activity_Controller.showList params
end

