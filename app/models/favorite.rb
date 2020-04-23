class Favorite < ApplicationRecord
  enum status: [:notpay, :pay]
  belongs_to :user
  belongs_to :course
end
