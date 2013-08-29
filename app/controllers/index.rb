

get '/' do
@broadcast = "Welcome to Cheeze-it vault!"
  session[:user_id] ||= false
  if session[:user_id] == true
    erb :secret, :locals => {all_urls: Url.all}
  else
    erb :index
  end
end

post '/sign_up' do
  begin 
  new_user = User.create!(name:params[:name],email:params[:email],password:params[:password])
  @broadcast = "User signup succesful"
  erb :index
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
    erb :secret, :locals => {all_urls: Url.all}
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


post '/urls' do
  puts params.inspect
  Url.create(long:params[:long_url], name:params[:url_title])
  erb :secret, :locals => {all_urls: Url.all}
end

get '/:short_url' do
  my_shorty = Url.find_by_short(params[:short_url])
  my_shorty.counter += 1 unless my_shorty.nil? 
  redirect "http://#{my_shorty.long}" unless my_shorty.nil?
  'SORRY, LINK DOES NOT EXIST'
end



