class AddMarksToSurveyAttempts < ActiveRecord::Migration[6.0]
  def change
    add_column :rapidfire_attempts, :marks, :integer
  end
end
