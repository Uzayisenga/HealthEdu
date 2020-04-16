class Credit < ApplicationRecord
  belongs_to :course, optional: true
  mount_uploader :upload_file, UploadFileUploader

end
