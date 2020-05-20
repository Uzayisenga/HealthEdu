class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many:replies, dependent: :destroy
  #after_commit :create_notifications, on: [:create]
  def create_notifications
    Notification.create(
      notify_type: 'comment',
      actor: self.user,
      user: self.course.user,
      target: self,
      second_target: self.course)
  end
  
end
