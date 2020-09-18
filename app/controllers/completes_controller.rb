class CompletesController < ApplicationController
  def create
    complete = current_user.completes.create(favorite_id: params[:favorite_id])
    redirect_to favorites_url, notice: " blog has been favorited"
  end
  def destroy
    complete = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to blogs_url, notice: "#{favorite.blog.user.name}'s blog has been unfavored"
  end
end
