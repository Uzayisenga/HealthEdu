class FavoritesController < ApplicationController
before_action :can_request_course, only: [:create]
  def create
    @favorites=Favorite.all
  end
  def index
    favorite = current_user.favorites.create(course_id: params[:course_id])
    redirect_to homepage_index_url, notice: "You have request this course, Please make payment on Bank of Kigali Bank Account: 00262-06949899-22 / Top-Upgrade Ltd or use MTN Mobile Money on 0788848750 registered to Uwandamiye Emmanuella or 0730300074 registered to Jean Damascene BIGIRIMANA. In case you have a question, contact of of those phone numbers or e-mail: healthedultd@gmail.com "
  end


def show
    #@favorite = current_user.favorites.find_by(course_id: @course.id)
    @favorite = Favorite.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
          render pdf: "certiicate No. #{@favorite.id}",
          page_size: 'A4',
          template: "favorites/show.html.erb",
          layout: "pdf.html",
          orientation: "Landscape",
          lowquality: true,
          zoom: 1,
          dpi: 75
      end
    end
  end
def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to homepage_index_url, notice: "#{favorite.course.user.names}'s has been unrequested #{favorite.course.title} course"
end
def certificate
  @favorites=Favorite.all
end

def can_request_course
  unless current_user && current_user.user_role == "professional"
    redirect_to favorites_url, notice: "only a proffessional can request a course"
  end
end


def report
  @initial = 0
  @favorites = Favorite.all
end
end

