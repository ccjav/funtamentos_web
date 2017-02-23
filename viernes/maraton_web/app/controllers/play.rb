get '/play' do
  @decks = Deck.all
  erb :play
end

get '/decks/:deck_id' do
  card = Card.where(deck_id: params[:deck_id])
  p "CURRENT CARD!! #{card[0].id}"
  session[:card] = 0
  @card = card[session[:card]]
  puts "SESSION EN GET"
  p session[:card]
  p @card.id
  # @deck = Deck.find(params[:deck_id])
  # if @deck.cards[0].id == @card.id
  #   round = Round.create(deck_id: params[:deck_id])
  # end
  # round = Round.create(deck_id: 1)
  #   session[:round] = round.id

  erb :deck
end

post '/play' do
  # card = Card.where(deck_id: params[:deck_id])
  p session
  round = Round.where(id: session[:round])
  p round

  deck = Deck.find(round[0].deck_id)
  p "DECK #{deck.cards[0]}"
  p round[0].deck_id
  # p round[0].guesses
  p "PARAMS #{params}"
  @card = deck.cards[session[:card]]
  p @card.answer
  p params[:answer]
  if params[:answer] == @card.answer
    Guess.create(correct: true, round_id: session[:round])
    @right_wrong = "Bien"
    # <p><a href=\"/decks/#{params[:deck_id]}/cards/#{params[:card_id].to_i + 1}\">Siguiente</a></p>"
    # redirect "/decks/#{params[:deck_id]}/cards/#{params[:card_id].to_i + 1}"
  else
    Guess.create(correct: false, round_id: session[:round])
    @right_wrong = "Mal"

        # redirect "/decks/#{params[:deck_id]}/cards/#{params[:card_id].to_i + 1}"

  end
  p "CARD #{@card.id}"
  if deck.cards[-1].id == @card.id
    @hola = "terminaste"
  end
  session[:card] += 1
  erb :_deck_form, layout: false


  # redirect "/decks/#{params[:deck_id]}/#{params[:card_id].to_i + 1}"

end