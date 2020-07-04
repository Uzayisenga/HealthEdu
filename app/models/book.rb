class Book < ApplicationRecord
    mount_uploader :book, UploadFileUploader
end
