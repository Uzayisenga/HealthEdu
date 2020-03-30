class RemoveFieldNameFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :oauth_token, :string

    remove_column :users, :oauth_expires_at, :datetime
  end
end
