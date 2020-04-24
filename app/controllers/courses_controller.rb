class CoursesController < ApplicationController
  skip_before_action :require_user
  before_action :set_student, only: [:show, :edit, :update]
  before_action :require_admin, except: [:show,:index]
#   before_action :require_same_student, only: [:create, :new, :edit, :update, :destroy]
  
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

    def destroy
        @course = Course.find(params[:id])
        @course.destroy
        flash[:success] = "Your course was successfully deleted"
        redirect_to courses_path
    end

    private

    def set_student
        @course = Course.find(params[:id])
    end

    def require_admin
        if !logged_in? || (logged_in? and !current_user.admin?)
            flash[:success] = "Only admins can perform that action"
            redirect_to courses_path
        end
    end

    # def require_same_student
    #     if current_user != !current_user.admin?
    #         flash[:success] = "You cannot perform that action"
    #         redirect_to root_path
    #     end
    # end

    def course_params
        params.require(:course).permit(:name, :short_name, :description)
    end
end
