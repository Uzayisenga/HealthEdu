class HomepageController < ApplicationController
  def index
    @courses = Course.all.first(3)

  end
end
