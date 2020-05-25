class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many:replies, dependent: :destroy
  after_commit :create_notifications, on: [:create]
  def create_notifications
    Notification.create do |notification|
      notification.notify_type = 'comment'
      notification.actor = self.user
      notification.user = self.course.user
      notification.target = self
      notification.second_target = self.course
    end
  end
end
