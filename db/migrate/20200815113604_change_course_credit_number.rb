class ChangeCourseCreditNumber < ActiveRecord::Migration[6.0]
  def change
    change_column :courses, :credit_number, 'integer USING CAST(credit_number AS integer)'
  end
end
