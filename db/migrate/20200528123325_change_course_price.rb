class ChangeCoursePrice < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :course_price
    add_column :courses, :course_price, :integer
  end
end
