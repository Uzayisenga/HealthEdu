class ApplicationController < ActionController::Base
    before_action :set_search
    before_action :authenticate_user!
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    #request
    def request_text
        return @request_exists ? 'Requested' : 'Request'
    end
     
     helper_method :request_text

    protected
        def configure_permitted_parameters
            # devise_parameter_sanitizer.for(:sign_up)  {|u| u.permit(:names, :email, :password, :user_role, :reguratory_body, :level, :working_place, :gender,:province, :district, :sector, :cell, :upload_diploma, :upload_cv, :availability_hour, :image, :phone) }
            devise_parameter_sanitizer.permit(:sign_up, keys: [:names, :last_name, :email, :password, :user_role, :reguratory_body, :level, :working_place, :gender,:province, :district, :sector, :cell, :apload_diploma, :apload_cv, :availabity_hour, :image, :phone])
            devise_parameter_sanitizer.permit(:account_update, keys: [:names, :last_name, :email, :password, :user_role, :reguratory_body, :level, :working_place, :gender,:province, :district, :sector, :cell, :apload_diploma, :apload_cv, :availabity_hour, :image, :phone])   
        end
<<<<<<< HEAD


        
=======
        def set_search
            @search=User.search(params[:q])
          end
>>>>>>> 99a331aa1dd742f9ee23a1873856735e230ec8f3
end
