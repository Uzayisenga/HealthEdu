class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :correct
      t.integer :possible
      t.integer :answer
      t.integer :distract
      t.integer :score
      t.integer :marks
      t.references :mc_question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
