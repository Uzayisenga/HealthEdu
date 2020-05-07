class HomepageController < ApplicationController
  def index
    @courses = Course.all
    
  end
end
