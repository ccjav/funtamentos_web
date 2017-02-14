get '/' do
  # @users = Word.all
  
  # Word.where(word: "A")
  # puts @hola
  erb :index
end

get '/:new_word' do
	@new_word = params[:new_word]
  @hola = Word.where(word: @new_word)
  @canon = @hola[0].canonical
  @canon_list = Word.where(canonical: @canon)
  erb :word
end

post '/new_word' do
  redirect to ("/#{params[:user_word]}")
end