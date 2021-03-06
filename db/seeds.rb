Deck.delete_all
User.delete_all
Round.delete_all
Card.delete_all
Guess.delete_all

2.times do
  deck = Deck.create(name: Faker::Hipster.word)
  10.times do
    deck.cards << Card.create(question: Faker::Hipster.sentence, answer: Faker::Hipster.word)
  end
end

5.times do
  user = User.create(username: Faker::Internet.user_name, password: '123', url: Faker::Avatar.image)
  20.times do
    user.rounds << Round.create(deck_id: Deck.all.sample.id)
  end
end

Round.all.each do |round|
  card_array = round.deck.cards.pluck(:id)
  until card_array.empty?
    chosen_card_id = card_array.sample
    correctness = [true, true, false].sample
    card_array.delete(chosen_card_id) if correctness
    round.guesses << Guess.create(card_id: chosen_card_id, is_correct: correctness)
  end
end

skippers = Deck.create(name: "fiery_skippers")
skippers.cards << Card.create(question: "Who always says 'It Works!'?", answer: "David")
skippers.cards << Card.create(question: "How many brothers and sisters does Kelson have?", answer: "10")
skippers.cards << Card.create(question: "Who merged to master???", answer: "Shin")
skippers.cards << Card.create(question: "Who never goes out??", answer: "Victoria")
skippers.cards << Card.create(question: "Who sleeps with the light on?", answer: "Elizabeth")


