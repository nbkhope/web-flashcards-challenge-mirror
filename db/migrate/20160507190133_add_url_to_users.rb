class AddUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :url, :string, default: "/images/default-user-image.png"
  end
end
