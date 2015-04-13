require_relative 'rolodex'
require 'sinatra'
require 'data_mapper'

$rolodex = Rolodex.new

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :note, String

  #the following are no longer needed because of above
  #attr_accessor :id, :first_name, :last_name, :email, :note

  #def initialize(first_name, last_name, email, note)
    #@first_name = first_name
    #@last_name = last_name
    #@email = email
    #@note = note
  #end
end

DataMapper.finalize
DataMapper.auto_upgrade!

#routes
#home page
get '/' do
  @crm_app_name = "My CRM"
  erb :index
end
#contacts list
get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end
#add new contact
get '/contacts/new' do
  erb :new_contact
end
#display specific contact
get "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end
#Edit specific contact
get "/contacts/:id/edit" do
  @contact = Contact.get(params[:id])
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end
#changes contact info
put "/contacts/:id" do
  @contact = Contact.get(params[:id])
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    @contact.save
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end
#deletes contact
delete "/contacts/:id" do
  @contact = Contact.get(params[:id])
  if @contact
    @contact.destroy
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

#adds new contact
post '/contacts' do
  new_contact = Contact.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    note: params[:note]
    )

  redirect to('/contacts')
end
