class HomepageController < ApplicationController
  def index
    @courses = Course.all.last(8)

  end
end
