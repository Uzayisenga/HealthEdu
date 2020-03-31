class Users::RegistrationsController < Devise::RegistrationsController
  #make sure to override devise
  def build_resource(hash={})
    hash[:uid] = User.create_unique_string
    super
  end
end

