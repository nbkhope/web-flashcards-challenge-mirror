helpers do

  def next_card
    @round ||= Round.find_by(id: params[:round_id])

    cards_in_deck = Deck.find_by(id: params[:deck_id]).cards.pluck(:id)
    correct_cards = Guess.where(round_id: @round.id, is_correct: true).pluck(:card_id)
    available_cards = cards_in_deck - correct_cards
    Card.find_by(id: available_cards.sample)
  end
end
