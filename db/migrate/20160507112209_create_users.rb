class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :username, null: false
      t.string  :password_hash, null: false

      t.timestamps  null: false
    end

    # Make the username unique 
    # (so you cannot create multiple accounts with the same username)
    add_index :users, :username, unique: true
  end
end
