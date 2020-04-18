class RemoveFieldNameFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :province
    remove_column :users, :sector
    remove_column :users, :cell
    remove_column :users, :availabity_hour
  end
end
