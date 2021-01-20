class Favorite < ApplicationRecord
  has_many :completes, dependent: :destroy
  has_many :complete_users, through: :completes, source: :user
  enum status: [:not_paid, :paid, :annual_subscription]
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

  def self.search(search, id)
    if search
      where(['title LIKE ?', "%#{search}%"])
    else
     scoped
    end
   end

end
