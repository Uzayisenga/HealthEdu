class FavoritesController < ApplicationController

  def index
    
end
  def create
    @favorites=Favorite.all
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

