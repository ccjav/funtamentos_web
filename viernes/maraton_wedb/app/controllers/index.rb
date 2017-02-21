before '/users/:id' do
  pass if session[:id]
  redirect '/login'
end

get '/' do
  if session[:id]
    @id = session[:id] 
  else
    @id = "d"
  end
  erb :index
end

get '/register' do
  erb :register
end

post '/register' do
  @user = User.new(name: params[:name], email: params[:email], password: params[:password])
  if @user.save
    redirect to ("/")
  else
    @error_name = @user.errors.messages[:name]
    @error_email = @user.errors.messages[:email]
    @error_password = @user.errors.messages[:password]
    erb :register
  end
end

get '/login' do
  erb :login
end

post '/login' do
  if @user = User.find_by(email: params[:email], password: params[:password])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @error = "Wrong email or password"
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :id
end