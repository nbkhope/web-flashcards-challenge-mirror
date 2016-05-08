get '/rounds/:round_id/decks/:deck_id/cards/:id' do

  @card = Card.find_by(id: params[:id])

  erb :"/cards/show"
end

post '/rounds/:round_id/decks/:deck_id/cards/:id' do

  Guess.create(card_id: params[:id], is_correct: is_correct?, round_id: params[:round_id])

  unless is_correct?
      redirect "/rounds/#{params[:round_id]}/decks/#{params[:deck_id]}/cards/#{params[:id]}/wrong_answer"
  end

  @card = next_card

  if @card
    redirect "/rounds/#{params[:round_id]}/decks/#{params[:deck_id]}/cards/#{@card.id}"
  else
    redirect "/rounds/#{params[:round_id]}/decks/#{params[:deck_id]}/completed"
  end

end

get '/rounds/:round_id/decks/:deck_id/cards/:id/wrong_answer' do
  @card = next_card
  erb :"/cards/wrong_answer"
end
