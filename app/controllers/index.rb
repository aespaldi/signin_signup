
get '/' do
  # let user create new short URL, display a list of shortened URLs
  @all_urls = Url.all
  erb :index
end

post '/urls' do
  puts params.inspect
  Url.create(long:params[:long_url], name:params[:url_title])
  @all_urls = Url.all
  erb :index 
end

# e.g., /q6bda
get '/:short_url' do
  my_shorty = Url.find_by_short(params[:short_url])
  my_shorty.counter += 1 unless my_shorty.nil? 
  redirect "http://#{my_shorty.long}" unless my_shorty.nil?
  'SORRY, LINK DOES NOT EXIST'
end
