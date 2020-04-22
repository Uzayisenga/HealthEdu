class AddVideoToCredits < ActiveRecord::Migration[6.0]
  def change
    add_column :credits, :video, :string
  end
end
