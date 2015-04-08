require_relative 'contact'
require 'sinatra'

get '/' do
  @t = Time.now
  @crm_app_name = "My CRM"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :index
end

