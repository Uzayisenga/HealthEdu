class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:google, :facebook, :twitter]

         has_many :courses, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :requests, dependent: :destroy

         has_many :courses, dependent: :destroy
         mount_uploader :image, ImageUploader
         mount_uploader :apload_diploma, AploadDiplomaUploader
         mount_uploader :apload_cv, AploadCvUploader
         def self.create_unique_string
          SecureRandom.uuid
        end
         def self.find_for_google(auth)
          user = User.find_by(email: auth.info.email)
          unless user
            user = User.new(email: auth.info.email,
                            provider: auth.provider,
                            uid:      auth.uid,
                            password: Devise.friendly_token[0, 20],
                                       )
          end
          user.save
          user
        end

        def self.find_for_twitter(auth)
          user = User.find_by(email: auth.info.email)
          unless user
            user = User.new(email: auth.info.email,
                            provider: auth.provider,
                            uid:      auth.uid,
                            password: Devise.friendly_token[0, 20],
                                       )
          end
          user.save
          user
        end

        def self.find_for_facebook(auth)
          user = User.find_by(email: auth.info.email)
        
          unless user
            user = User.new(email: auth.info.email,
                            provider: auth.provider,
                            uid:      auth.uid,
                            password: Devise.friendly_token[0, 20],
                                         )
          end
          user.save
          user
        end
        
      
        # def self.search(search)
          
        #   #  where('names LIKE ?', "%#{search}%")
          
        # end
end
