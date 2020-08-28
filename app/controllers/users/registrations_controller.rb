class Users::RegistrationsController < Devise::RegistrationsController
  #make sure to override devise
  def build_resource(hash={})
    hash[:uid] = User.create_unique_string
    super
  end

  def search
    @user =user.search(params[:search])
  end

  private

  def sign_up_params
    params.require(:user).permit(:names, :email, :phone, :gender, :province, :district, :password, :password_confirmation, :current_password, :user_role, :reguratory_body, :apload_diploma, :apload_cv, :working_place, :last_name, :search)
  end

  def account_update_params
    params.require(:user).permit(:names, :email, :phone, :gender, :province, :district, :password, :password_confirmation, :current_password, :user_role, :reguratory_body, :apload_diploma, :apload_cv, :working_place, :last_name, :search)
  end
end

