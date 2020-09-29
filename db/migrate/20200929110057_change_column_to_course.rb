class ChangeColumnToCourse < ActiveRecord::Migration[6.0]
  def change
    rename_column :course, :file, :course_for
  end
end
