class McQuestion < ApplicationRecord
  belongs_to :quiz
  acts_as_notifiable :users,
         targets: :custom_notification_users,
         group: :quiz,
         notifier: :user,
         email_allowed: :custom_notification_email_to_users_allowed?,
         notifiable_path: :custom_notifiable_path



         # acts_as_notifiable configures your model as ActivityNotification::Notifiable
  # with parameters as value or custom methods defined in your model as lambda or symbol
  acts_as_notifiable :users,
  # Notification targets as :targets is a necessary option
  # Set to notify to author and users mc_questioned to the quiz, except mc_question owner self
  targets: ->(mc_question, key) {
    ([mc_question.quiz.user] + mc_question.quiz.mc_questioned_users.to_a - [mc_question.user]).uniq
  },
  # Path to move when the notification will be opened by the target user
  # This is a optional since activity_notification uses polymorphic_path as default
  notifiable_path: :quiz_notifiable_path

def quiz_notifiable_path
  quiz_path(quiz)
end
end
