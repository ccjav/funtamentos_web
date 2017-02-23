get '/stats' do
  @rounds = Round.all
  p @rounds
  erb :stats
end

get '/stats/:round_id' do
  @round = Round.find(params[:round_id])
  @deck = Deck.find(@round.deck_id)
  @guesses = @round.guesses
  erb :single_stat
end