class HomepageController < ApplicationController
  def index
    @courses = Course.all.last(3)

  end
end
