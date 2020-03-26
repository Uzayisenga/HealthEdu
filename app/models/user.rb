class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :courses, dependent: :destroy
         has_many :comments

         has_many :courses
         mount_uploader :image, ImageUploader
         mount_uploader :apload_diploma, AploadDiplomaUploader
         mount_uploader :apload_cv, AploadCvUploader
        
        def self.search(search)
          if term
            where('names LIKE ?', "%#{search}%")
          end
        end
end
