class Course < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user, optional: true
  mount_uploader :image, ImageUploader
  mount_uploader :upload_file, UploadFileUploader
  validates :content,  length: { minimum: 100 }
  validates :content, :course_price, :image, :credit_number, :title, :upload_file, :status,:attemption, :user_id, presence: true
end
