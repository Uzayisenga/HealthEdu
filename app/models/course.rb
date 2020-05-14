class Course < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :payments, dependent: :destroy
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
  validates :content, :course_price, :image, :credit_number, :title, :upload_file, :status,:attemption, :user_id, presence: true



  # acts_as_notifiable configures your model as ActivityNotification::Notifiable
  # with parameters as value or custom methods defined in your model as lambda or symbol
  acts_as_notifiable :users,
    # Notification targets as :targets is a necessary option
    # Set to notify to author and users courseed to the quiz, except course owner self
    targets: ->(course, key) {
      ([course.quiz.user] + course.quiz.courseed_users.to_a - [course.user]).uniq
    },
    # Path to move when the notification will be opened by the target user
    # This is a optional since activity_notification uses polymorphic_path as default
    notifiable_path: :quiz_notifiable_path

  def quiz_notifiable_path
    quiz_path(quiz)
  end

  def follow(user)
    Notification.create(notify_type: 'create', actor: current_user, user: user)
  end
  #after_commit :create_notifications, on: [:create]
  
end
