class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.belongs_to  :card, {index: true}
      t.belongs_to  :round, {index: true}
      t.boolean     :is_correct

      t.timestamps  null: false
    end
  end
end
