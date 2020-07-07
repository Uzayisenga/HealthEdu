class Book < ApplicationRecord
    mount_uploader :book, UploadFileUploader
    mount_uploader :image, ImageUploader
end
