class FavoritesController < ApplicationController
  before_action :can_request_course, only: [:create]
  
def create
    favorite = current_user.favorites.create(course_id: params[:course_id])
    redirect_to homepage_index_url, notice: "You have request this course, Please make payment on Bank of Kigali Bank Account: 00262-06949899-22 / Top-Upgrade Ltd or use MTN Mobile Money on 0788848750 registered to Uwandamiye Emmanuella or 0730300074 registered to Jean Damascene BIGIRIMANA. In case you have a question, contact of of those phone numbers or e-mail: healthedultd@gmail.com "

end


end

