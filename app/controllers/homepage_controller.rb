class HomepageController < ApplicationController
  def index
    @currentUser = current_user.id
    @courses = Course.all
    
  end
  def notify
    @notifications = @target.notification_index_with_attributes
  end
end
