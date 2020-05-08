class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    drop_table :rapidfire_surveys
    drop_table :rapidfire_questions
    drop_table :rapidfire_attempts
    drop_table :rapidfire_answers
  end
end
