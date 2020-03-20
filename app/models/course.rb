class Course < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user, optional: true
  mount_uploader :image, ImageUploader
  mount_uploader :upload_file, UploadFileUploader
end
