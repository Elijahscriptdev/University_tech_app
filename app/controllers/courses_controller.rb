class CoursesController < ApplicationController
  skip_before_action :require_user
  
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
      @course = Course.new(course_params)
      if @course.save
          flash[:success] = "You have successfully enrolled for #{@course.name}"
          redirect_to courses_path
      else
          render 'new'
      end
  end


  private

  def course_params
        params.require(:course).permit(:name, :short_name, :description)
    end
end
