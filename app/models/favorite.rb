class Favorite < ApplicationRecord
  enum status: [:not_paid, :paid]
  belongs_to :user
  belongs_to :course
  STATUS_CLASS = {
        :draft => "badge badge-secondary",
        :sent => "badge badge-primary",
        :paid => "badge badge-success"
    }

  def course_modules_calculated
      self.course.credits.count
  end

  def week
    self.created_at.strftime('%B')
  end

end
