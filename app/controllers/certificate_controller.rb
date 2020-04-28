class CertificateController < ApplicationController
  def index
    @favorite = current_user.favorites.find_by(course_id: @course.id)
  end
end
