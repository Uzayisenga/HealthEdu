class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :profile, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, omniauth_providers: [:google, :facebook, :twitter]
         :confirmable

         has_many :courses, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :courses, dependent: :destroy
         has_many :completes, dependent: :destroy
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

        def self.search(search)
          if term
            where('names LIKE ? or last_name', "%#{search}%")
          else
            order('id desc')
          end
        end
        def self.order_list(sort_order)
          if sort_order == "names"
            order(names: :desc)
          else
            order(created_at: :desc)
          end
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
  attr_accessor :allow_blank_uid


  devise :validatable

  # Called by Devise to enable/disable password presence validation
  def password_required?
    allow_blank_uid ? false : super
  end

  # Don't require a password when importing users
  def before_import_save(record)
    self.allow_blank_uid = true
  end

        # def self.search(search)

        #   #  where('names LIKE ?', "%#{search}%")

        # end
        enum reguratory_body: [:RAHPC, :NPC, :RMDC, :NCNM]
        enum level: [:certificate_A2, :Advanced_Diploma, :Bachelor_Degree, :Masters_Degree, :PHD, :Others]
        enum working_place: [:Anaesthesia_Practitioner, :Biomedical_Engineer, :Medical_Laboratory_Practitioner, :BOccupational_Therapist,
        :Chiropractor, :Clinical_Medicine_Practitioner, :Nutritionist, :Environmental_Health_Professional, :Clinial_Psychologist, :Dental_Therapist,
        :Emergency_Care_Practitioner, :Clinical_Perfusionist, :Physiotherapist, :Speech_and_Language_Pathologist, :Medical_Imaging_Practitioner,
        :Prosthetists_and_Orthotist, :Orthopeadic_Clinical_Officer, :Public_Health_Practitioner, :Ophthalmic_Clinical_Officer,
        :Social_Work_Practitioner, :Optometry_Practitioner, :Theatre_Operating_Therapist, :Nurse,
        :Midwife, :Medical_Doctor, :Dental_Surgion,
        :Orthopaedic_Surgeon, :Cardiologist, :Pathologist, :Oncologist,
        :Neurosurgeons, :Radiologists, :Internists_practitioners, :Pharmacists, :Student, :Other,]


end