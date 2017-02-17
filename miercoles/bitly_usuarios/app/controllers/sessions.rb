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

