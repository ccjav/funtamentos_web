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



get '/login' do
  erb :login
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :id
end