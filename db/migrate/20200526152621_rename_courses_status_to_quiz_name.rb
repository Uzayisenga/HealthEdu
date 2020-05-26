class RenameCoursesStatusToQuizName < ActiveRecord::Migration[6.0]
  def change
    rename_column :courses, :status, :quiz_link
    rename_column :courses, :upload_file, :content_attract
  end
end
