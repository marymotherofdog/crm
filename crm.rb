require_relative 'contact'
require 'sinatra'

get '/' do
  @t = Time.now
  @crm_app_name = "My CRM"
  erb :index
end

get '/contacts' do
  @contacts = []
  @contacts << Contact.new("Yehuda", "Katz", "yehuda@example.com", "Developer")
  @contacts << Contact.new("Mark", "Zuckerberg", "mark@facebook.com", "CEO")
  @contacts << Contact.new("Sergey", "Brin", "sergey@google.com", "Co-Founder")

  erb :contacts
end

get '/contacts/new' do
  erb :index
end

