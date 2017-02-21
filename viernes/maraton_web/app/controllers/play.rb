get '/play' do
  @decks = Deck.all
  @decks.each do |x|
    p x.name#.cards[0].question
  end
  erb :play
end

get '/decks/:deck_id/:card_id' do 
  cards = Card.where(deck_id: params[:deck_id])
  @card = cards.find(params[:card_id])
  p @card.deck
  erb :deck
end

post '/:deck_id/:card_id/answer' do
  p params[:card_id]
  round = Round.create(deck_id: params[:deck_id])
  card = Card.find(params[:card_id])
  correct_answer = card.answer
  if params[:answer] == correct_answer
    Guess.create(correct: true)
    p "BIENN!!!"
  else
    Guess.create(correct: false)
    p "MAAALL!!"
  end
  redirect "/decks/#{params[:deck_id]}/#{params[:card_id].to_i + 1}"
  # if @user = User.find_by(email: params[:email], password: params[:password])
  #   session[:id] = @user.id
  #   redirect "/"
  # else
  #   @error = "Wrong email or password"
  #   erb :login
  # end
end