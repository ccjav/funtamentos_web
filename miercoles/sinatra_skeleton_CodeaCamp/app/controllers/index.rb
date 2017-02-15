get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs. 
  @last_url = Url.all
  erb :index
end



post '/urls' do
  # crea una nueva Url
  @url = Url.new(url: params[:user_word])
  if @url.save
    redirect to ("/")
  else
    puts "ERRORR!! #{@url.errors.messages[:url]}"
    # if @url.errors.messagesh[:name]
    @error = "error"
    erb :index
  end
end



# e.g., /q6bda
get '/:short_url' do
  # redirige a la URL original
  puts "short url"
  dir = request.path_info.last(6)
  r = Url.where(short_url: dir)
  r[0].increment!(:click_count, 1)
  z = r[0].url
  puts z
  redirect to (z)
end
