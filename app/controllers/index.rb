
get '/' do
@broadcast = "Welcome to Cheeze-it vault!"
erb :index
end

post '/sign_up' do
  begin 
  new_user = User.create!(name:params[:name],email:params[:email],password:params[:password])
  rescue Exception => e
  @broadcast = e.message
  end
  erb :index

end

# e.g., /q6bda
post '/sign_in' do 
  if User.authenticate(params[:email],params[:password])
    erb :secret
  else
    @broadcast = "log in Error"
    erb :index
  end

end
