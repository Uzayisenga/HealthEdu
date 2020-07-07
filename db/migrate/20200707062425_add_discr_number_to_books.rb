class AddDiscrNumberToBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :summary, :text
    add_column :books, :image, :string
  end
end
