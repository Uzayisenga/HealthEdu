class HomepageController < ApplicationController
  def index
    @courses = Course.all
    
  end
  def notify
    @notifications = @target.notification_index_with_attributes
  end
end
