class FavoritesController < ApplicationController
  def index
    @favorites=Favorite.all        
end

def create
    favorite = current_user.favorites.create(course_id: params[:course_id])
    redirect_to courses_url, notice: "#{favorite.course.user.names}'s has been request #{favorite.course.title} course. Please pay #{favorite.course.course_price} 
  FRW to this number 0787939119 to get the course. Thank you!"
end
def show
    @favorite = current_user.favorites.find_by(course_id: @course.id)
  end
def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to courses_url, notice: "#{favorite.course.user.names}'s has been unrequested #{favorite.course.title} course" 
end
end
