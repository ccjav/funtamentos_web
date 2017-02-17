before '/users/:id' do
  pass if session[:id]
  redirect '/login'
end

# get '/' do
#   p session
#   if session[:id]
#     @id = session[:id] 
#   else
#     @id = "d"
#   end
#   erb :index
# end

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

get '/users/:id' do
  @user = User.find(params[:id])
  erb :id
end