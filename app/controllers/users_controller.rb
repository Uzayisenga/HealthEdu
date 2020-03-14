class UsersController < ApplicationController
  before_action :only_council  
  def index
  end
  def show
    @user = User.find_by_names(params[:id])
  end
  def only_council
    if current_user.user_role != 'council'
      redirect_to courses_url, notice: 'go to courses'
    end
  end
end
