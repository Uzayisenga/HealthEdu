class User < ApplicationRecord
  
        
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_one :profile, dependent: :destroy

  acts_as_target email: :email, email_allowed: :confirmed_at
  acts_as_target
  acts_as_notifiable :users,
         targets: :custom_notification_users,
         group: :article,
         notifier: :user,
         email_allowed: :custom_notification_email_to_users_allowed?,
         notifiable_path: :custom_notifiable_path
         

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:google, :facebook, :twitter]
         :confirmable

         has_many :courses
         has_many :comments
         has_many :requests
         has_many :favorites
         has_many :courses
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
        enum reguratory_body: [:RAHPC, :NPC, :RMDC, :NCNM]
        enum level: [:certificate_A2, :Advanced_Diploma, :Bachelor_Degree, :Masters_Degree, :PHD, :Others]
        enum working_place: [:not_paid, :paid]
        
        def follow(user)
          Notification.create(notify_type: 'follow', actor: self, user: user)
        end
  
end  
