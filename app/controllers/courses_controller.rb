class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
  end
end
