class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :image
      t.string :title
      t.string :credit_number
      t.text :content
      t.string :upload_file
      t.string :course_price
      t.string :status
      t.string :marks
      t.string :attemption
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
