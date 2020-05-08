class AddCourseIdToRapidfireSurveys < ActiveRecord::Migration[6.0]
  def change
    add_reference :rapidfire_surveys, :course, null: false, foreign_key: true
  end
end
