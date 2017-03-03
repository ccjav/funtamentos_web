get '/play' do
  @decks = Deck.all
  erb :play
end

get '/decks/:deck_id' do
  card = Card.where(deck_id: params[:deck_id])
  session[:card] = 0
  @card = card[session[:card]] 
  if @card == card[0]
    round = Round.create(deck_id: params[:deck_id])
    session[:round] = round.id
  end
  erb :deck
end

post '/play' do
  round = Round.find(session[:round])  
  deck = Deck.find(round.deck_id) 
  @card_answer = deck.cards[session[:card]].answer
  session[:card] += 1
  @card = deck.cards[session[:card]]
  if params[:answer] == @card_answer
    Guess.create(correct: true, round_id: session[:round])
    @right_wrong = "Bien"
   else
    Guess.create(correct: false, round_id: session[:round])
    @right_wrong = "Mal"
  end

  if deck.cards[-1].id == @card.id
    @hola = "<a href=\"/stats/#{round.id}\">Stats</a>"
  end
  erb :_deck_form, layout: false
end