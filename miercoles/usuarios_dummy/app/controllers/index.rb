enable :sessions

get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
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
    # @error = @user.errors.messages[:url]
    # if @error[0] == "is invalid"
    #   @error = "Url inválida. No olvide inicial con 'http'"
    # end
    erb :index
  end
end

get '/login' do
  p session
  # session[:foo] ||= 'Hello World!'

  erb :login
end

post '/login' do
  p session
  p session[:foo]
  response.set_cookie "foo", "bar"
  erb :loginn
end

get '/logout' do
  session.clear
  redirect '/login'
end

get '/logged' do
  erb :login
end