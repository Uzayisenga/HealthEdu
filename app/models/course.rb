class Course < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :credits, dependent: :destroy
  has_many :favorites, dependent: :destroy
  #@comment.notify :users, key: "comment.reply"
  acts_as_notifiable :users,
         targets: :custom_notification_users,
         group: :quiz,
         notifier: :user,
         email_allowed: :custom_notification_email_to_users_allowed?,
         notifiable_path: :custom_notifiable_path
         
  
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user, optional: true
  acts_as_notification_group printable_name: ->(course) { "course \"#{course.title}\"" }
  mount_uploader :image, ImageUploader
  mount_uploader :upload_file, UploadFileUploader
  validates :content,  length: { minimum: 100 }
  validates :content, :course_price, :image, :credit_number, :title, :status, :user_id, presence: true
  after_commit :create_notifications, on: [:create]
  def create_notifications
    User.where(user_role: 'professional').each do |student|
      Notification.create do |notification|
        notification.notify_type = 'create'
        notification.actor = self.user
        
        notification.user = student
        
        notification.target = self
        # notification.second_target = self.course
      end
    end
  end
end
