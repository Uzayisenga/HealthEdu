# Auto generate with notifications gem.
class Notification < ActiveRecord::Base
  include Notifications::Model
  validates :user_id, presence: true
  has_one :user, class_name: "User", :foreign_key => "user_id" 
  # Write your custom methods...
end
