class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def index
    @favorites=Favorite.all        
end

def create
    favorite = current_user.favorites.create(course_id: params[:course_id])
    redirect_to homepage_index_url, notice: "#{favorite.course.user.names}'s has been request #{favorite.course.title} course. Please pay #{favorite.course.course_price} 
  FRW to this number 0787939119 to get the course. Thank you!"
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

end

