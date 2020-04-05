class HomepageController < ApplicationController
  def index
    @currentUser = current_user.id
    @courses = Course.all
  end
end
