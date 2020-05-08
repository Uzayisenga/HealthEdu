class Credit < ApplicationRecord
  belongs_to :course, optional: true
  mount_uploader :video, VideoUploader
  mount_uploader :upload_file, UploadFileUploader
  #@credit.notify :users, key: "credit.reply"
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
# Set to notify to author and users credited to the course, except credit owner self
targets: ->(credit, key) {
([credit.course.user] + credit.course.credited_users.to_a - [credit.user]).uniq
},
# Path to move when the notification will be opened by the target user
# This is a optional since activity_notification uses polymorphic_path as default
notifiable_path: :course_notifiable_path

def course_notifiable_path
course_path(course)
end

end
