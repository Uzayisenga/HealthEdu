class Favorite < ApplicationRecord
  enum status: [:not_paid, :paid]
  belongs_to :user
  belongs_to :course
  #@favorite.notify :users, key: "favorite.reply"
  STATUS_CLASS = {
        :draft => "badge badge-secondary",
        :sent => "badge badge-primary",
        :paid => "badge badge-success"
    }

  def course_modules_calculated
      self.course.credits.count
  end
  acts_as_notifiable :users,
         targets: :custom_notification_users,
         group: :course,
         notifier: :user,
         email_allowed: :custom_notification_email_to_users_allowed?,
         notifiable_path: :custom_notifiable_path





  # acts_as_notifiable configures your model as ActivityNotification::Notifiable
  # with parameters as value or custom methods defined in your model as lambda or symbol
  acts_as_notifiable :users,
  # Notification targets as :targets is a necessary option
  # Set to notify to author and users commented to the course, except favorite owner self
  targets: ->(favorite, key) {
    ([favorite.course.user] + favorite.course.commented_users.to_a - [favorite.user]).uniq
  },
  # Path to move when the notification will be opened by the target user
  # This is a optional since activity_notification uses polymorphic_path as default
  notifiable_path: :course_notifiable_path

def course_notifiable_path
  course_path(course)
end
end
