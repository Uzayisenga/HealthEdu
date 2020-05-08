class AddDiscriptionToCredits < ActiveRecord::Migration[6.0]
  def change
    add_column :credits, :discription, :text
  end
end
