class Course < ApplicationRecord
  paginates_per 2
  has_many :comments, dependent: :destroy
  has_many :credits, dependent: :destroy
  has_many :favorites
  
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user, optional: true
  mount_uploader :image, ImageUploader
  validates :content,  length: { minimum: 100 }
  validates :content, :course_price, :content_attract, :credit_number, :title, :quiz_link, :user_id, presence: true
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
