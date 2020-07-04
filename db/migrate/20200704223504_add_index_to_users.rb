class AddIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :uid, unique: true
    add_index :users, :provider, unique: true
  end
end
