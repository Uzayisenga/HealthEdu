class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :reply
  #@quiz.notify :users, key: "quiz.reply"
  acts_as_notifiable :users,
         targets: :custom_notification_users,
         group: :comment,
         notifier: :user,
         email_allowed: :custom_notification_email_to_users_allowed?,
         notifiable_path: :custom_notifiable_path
         notification_index: :notification_email_allowed?
         notifiable_path: :notification_email_allowed?


  # acts_as_notifiable configures your model as ActivityNotification::Notifiable
  # with parameters as value or custom methods defined in your model as lambda or symbol
  acts_as_notifiable :users,
  # Notification targets as :targets is a necessary option
  # Set to notify to author and users commented to the comment, except reply owner self
  targets: ->(reply, key) {
    ([reply.comment.user] + reply.comment.commented_users.to_a - [reply.user]).uniq
  },
  # Path to move when the notification will be opened by the target user
  # This is a optional since activity_notification uses polymorphic_path as default
  notifiable_path: :comment_notifiable_path

def comment_notifiable_path
  comment_path(comment)
end
end
