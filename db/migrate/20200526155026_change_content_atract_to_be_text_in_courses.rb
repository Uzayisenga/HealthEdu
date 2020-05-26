class ChangeContentAtractToBeTextInCourses < ActiveRecord::Migration[6.0]
  def change
    change_column :courses, :content_attract, :text
  end
end
