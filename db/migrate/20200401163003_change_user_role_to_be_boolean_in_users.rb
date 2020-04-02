class ChangeUserRoleToBeBooleanInUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :user_role, :string, :default => "professional"
  end
end
