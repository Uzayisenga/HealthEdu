class CreateCompletes < ActiveRecord::Migration[6.0]
  def change
    create_table :completes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :favorite, null: false, foreign_key: true
      t.string :status, default: Complete

      t.timestamps
    end
  end
end
