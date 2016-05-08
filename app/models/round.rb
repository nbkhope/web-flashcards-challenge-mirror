class Round < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  has_many :guessed_cards, through: :guesses, source: :cards


  def stats
    {total_guesses:         total_guesses,
      date_updated:         self.updated_at,
      correct_on_first_try: correct_on_first_try,
      total_cards:          self.deck.cards.count}
  end

  private

  def total_guesses
    self.guesses.count
  end

  def correct_on_first_try
    falses = self.guesses.where(is_correct: false).pluck(:card_id)
    all_card_ids = self.deck.cards.pluck(:id)
    trues = all_card_ids - falses
    trues.count
  end

end
