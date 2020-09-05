class HomepageController < ApplicationController
  def index
    @courses = Course.all.last(9)

    @profiles =Profile.all

  end
end
