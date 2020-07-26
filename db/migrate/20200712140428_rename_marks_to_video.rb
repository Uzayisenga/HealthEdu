class RenameMarksToVideo < ActiveRecord::Migration[6.0]
  def change
    rename_column :courses, :marks, :video
  end
end
