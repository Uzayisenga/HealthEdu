class FavoritesController < ApplicationController
  before_action :can_request_course, only: [:create]

  def all_favorite
      @favorites=Favorite.all
    end
    def index
      favorite = current_user.favorites.create(course_id: params[:course_id])
      redirect_to homepage_index_url, notice: "You have requested this course, Please make your payment at Bank of Kigali Account: 00262-06949899-22 / HealthEdu Ltd or use MTN Mobile Money on 0788848750 registered to Uwandamiye Emmanuella or Momo Pay: 000602. Contact us to this e-mail: healthedultd@gmail.com or Tel.: 0789044439."
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