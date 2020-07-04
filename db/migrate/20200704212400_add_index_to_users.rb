class AddIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_index :users, :uid
    remove_index :users, :provider
  end
end
