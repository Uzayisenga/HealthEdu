class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  #@payment.notify :users, key: "payment.reply"
  acts_as_notifiable :users,
         targets: :custom_notification_users,
         group: :payment,
         notifier: :user,
         email_allowed: :custom_notification_email_to_users_allowed?,
         notifiable_path: :custom_notifiable_path


         # acts_as_notifiable configures your model as ActivityNotification::Notifiable
  # with parameters as value or custom methods defined in your model as lambda or symbol
  acts_as_notifiable :users,
  # Notification targets as :targets is a necessary option
  # Set to notify to author and users paymented to the course, except payment owner self
  targets: ->(payment, key) {
    ([payment.course.user] + payment.course.payment_users.to_a - [payment.user]).uniq
  },
  # Path to move when the notification will be opened by the target user
  # This is a optional since activity_notification uses polymorphic_path as default
  notifiable_path: :article_notifiable_path

def article_notifiable_path
  article_path(course)
end

end
