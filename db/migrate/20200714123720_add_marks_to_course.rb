class AddMarksToCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :marks, :string
  end
end
