class Credit < ApplicationRecord
  belongs_to :course
  mount_uploader :video, VideoUploader
end
