class AddAssessmentToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :assessment, :string
  end
end
