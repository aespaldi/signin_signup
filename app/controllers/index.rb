enable :sessions

get '/' do
@broadcast = "Welcome to Cheeze-it vault!"
  session[:user_id] ||= false
  if session[:user_id] == true
    erb :secret
  else
    erb :index
  end
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
  @this_user = User.authenticate(params[:email],params[:password]) 
   if @this_user
    session[:user_id] = true
    erb :secret
  else
    @broadcast = "log in Error"
    erb :index
  end
end


post '/logout' do
  session.clear
  @broadcast = "logged out succesfully"
  erb :index
end
