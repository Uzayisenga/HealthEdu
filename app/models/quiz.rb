class Quiz < ApplicationRecord
  belongs_to :course
  has_many :mc_questions
  
  acts_as_notifiable :users,
         targets: :custom_notification_users,
         group: :course,
         notifier: :user,
         email_allowed: :custom_notification_email_to_users_allowed?,
         


  # acts_as_notifiable configures your model as ActivityNotification::Notifiable
  # with parameters as value or custom methods defined in your model as lambda or symbol
 
  # Notification targets as :targets is a necessary option
  # Set to notify to author and users quized to the course, except quiz owner self
  targets: ->(quiz, key) {
    ([quiz.course.user] + quiz.course.quiz_users.to_a - [quiz.user]).uniq
  },
  # Path to move when the notification will be opened by the target user
  # This is a optional since activity_notification uses polymorphic_path as default
  notifiable_path: :course_notifiable_path

def course_notifiable_path
  course_path(course)
end
end
