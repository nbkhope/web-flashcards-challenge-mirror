get '/decks' do
  @decks = Deck.all
  erb :'/decks/index'
end

get '/decks/:deck_id' do
  if logged_in?
    @current_user = current_user
  else
    @current_user = create_guest_user
  end
  @round = Round.create(user_id: @current_user.id, deck_id: params[:deck_id])
  @card = next_card
  @deck = @round.deck

  redirect "/rounds/#{@round.id}/decks/#{@deck.id}/cards/#{@card.id}"
end


get '/rounds/:round_id/decks/:id/completed' do

  @round = Round.find_by(id: params[:round_id])

  erb :"/decks/completed"
end

