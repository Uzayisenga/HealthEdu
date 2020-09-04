class HomepageController < ApplicationController
  def index
    @courses = Course.all.last(8)

    @profiles =Profile.all

  end
end
