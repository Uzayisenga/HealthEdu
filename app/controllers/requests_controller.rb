class RequestsController < ApplicationController
  before_action :authenticate_user!
  def index
   @requests=Request.all
  end
  
  

  
  def update
    request = Request.where(Course: Course.find(params[:course]), user: email)
    if request = []
      #create request
      Request.create(course: Course.find(params[:course]), user: email)
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
