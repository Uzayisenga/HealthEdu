class AddColumnsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :image, :string
    add_column :users, :names, :string
    add_column :users, :gender, :string
    add_column :users, :phone, :string
    add_column :users, :province, :string
    add_column :users, :district, :string
    add_column :users, :sector, :string
    add_column :users, :cell, :string
    add_column :users, :reguratory_body, :string
    add_column :users, :level, :string
    add_column :users, :user_role, :string
    add_column :users, :apload_diploma, :string
    add_column :users, :apload_cv, :string
    add_column :users, :availabity_hour, :string
    add_column :users, :working_place, :string
  end
end
