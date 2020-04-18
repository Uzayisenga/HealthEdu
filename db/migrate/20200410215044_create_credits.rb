class CreateCredits < ActiveRecord::Migration[6.0]
  def change
    create_table :credits do |t|
      t.string :name
      t.string :upload_file
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
