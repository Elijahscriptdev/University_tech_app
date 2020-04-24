class CoursesController < ApplicationController
  skip_before_action :require_user
  before_action :set_student, only: [:show, :edit, :update]
  
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
      @course = Course.new(course_params)
      if @course.save
          flash[:success] = "You have successfully created this course"
          redirect_to courses_path
      else
          render 'new'
      end
  end


  def edit
  end

    def update
        if @course.update(course_params)
            flash[:success] = "Your profile successfully edited this course"
            redirect_to courses_path
        else
            render 'edit'
        end
    end

    def show
    end

    private

    def set_student
        @course = Course.find(params[:id])
    end

  def course_params
        params.require(:course).permit(:name, :short_name, :description)
    end
end
