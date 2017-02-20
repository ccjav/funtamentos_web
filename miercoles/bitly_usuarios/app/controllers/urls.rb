after '/urls' do
  @hola = 6
end

before '/' do
  @hola = @hola
  if logged_in?
    @session = current_user
  end
end

get '/' do
  @last_url = Url.all
  p @url
  erb :index
end

post '/' do
  # crea una nueva Url
  if logged_in?
    @url = Url.new(url: params[:user_word], user_id: current_user)
  else
    @url = Url.new(url: params[:user_word])
  end
  if @url.save
    redirect to ("/")
  else
    @error = @url.errors.messages[:url]
    if @error[0] == "is invalid"
      @error = "Url inválida. No olvide iniciar con 'http'"
    end
    erb :index
  end
end

get '/users/:id' do
  @user_urls = Url.where(user_id: current_user)
  @user = User.find(current_user)
  erb :profile
end

# e.g., /q6bda
get '/short/:short_url' do
  # redirige a la URL original
  dir = "http://www.sho.rt#{request.path_info.last(7)}"
  current_field = Url.where(short_url: dir)
  current_field[0].increment!(:click_count, 1)
  original_url = current_field[0].url
  redirect to (original_url)
end


