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
    @error = @url.errors.messages[:url]
    if @error[0] == "is invalid"
      @error = "Url inválida. No olvide inicial con 'http'"
    end
    erb :index
  end
end

# e.g., /q6bda
get '/:short_url' do
  # redirige a la URL original
  puts "short url"
  dir = "http://www.sho.rt#{request.path_info}"
  puts dir
  current_field = Url.where(short_url: dir)
  puts "current field ... #{current_field[0]}"
  current_field[0].increment!(:click_count, 1)
  original_url = current_field[0].url
  # puts original_url
  redirect to (original_url)
end


