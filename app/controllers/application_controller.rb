class ApplicationController < ActionController::Base
    # before_action :set_search
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    #request
    def request_text
        return @request_exists ? 'Requested' : 'Request'
    end

     helper_method :request_text
    
def default_url_options
  if Rails.env.production?
   {:host => "healtheducat.rw"}
  else  
   {}
  end
 end
    protected
        def configure_permitted_parameters
            # devise_parameter_sanitizer.for(:sign_up)  {|u| u.permit(:names, :email, :password, :user_role, :reguratory_body, :level, :working_place, :gender,:province, :district, :sector, :cell, :upload_diploma, :upload_cv, :availability_hour, :image, :phone) }
            devise_parameter_sanitizer.permit(:sign_up, keys: [:names, :last_name, :email, :password, :current_password.blank?, :user_role, :reguratory_body, :level, :working_place, :gender,:province, :district, :sector, :cell, :apload_diploma, :apload_cv, :availabity_hour, :image, :phone])
            devise_parameter_sanitizer.permit(:account_update, keys: [:names, :last_name, :email, :password, :current_password.blank?, :user_role, :reguratory_body, :level, :working_place, :gender,:province, :district, :sector, :cell, :apload_diploma, :apload_cv, :availabity_hour, :image, :phone])
        end
        # def set_search
        #     @search=User.search(params[:q])
        # end


end
