class RequestsController < ApplicationController
  def update
    request = Request.where(Course: Course.find(params[:course]), user: current_user)
    if request = []
      #create request
      Request.create(course: Course.find(params[:course]), user: current_user)
      @request_exists = true
    else
      #delete request
      request.destroy_all
      @request_exists = false
    end
    respond_to do |format|
      format.html {}
      format.js {}
    end
  end
end
