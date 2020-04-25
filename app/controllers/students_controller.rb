class StudentsController < ApplicationController
  skip_before_action :require_user
  before_action :set_student, only: %i[show edit update]
  before_action :require_same_student, only: %i[edit update destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      # flash[:success] = "You have successfully signed up #{@student.name}"
      # redirect_to student_path(@student)
      redirect_to login_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @student.update(student_params)
      flash[:success] = 'Your profile was successfully edited'
      redirect_to student_path(@student)
    else
      render 'edit'
    end
  end

  def show; end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:success] = 'Your profile was successfully deleted'
    redirect_to students_path
  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

  def require_same_student
    if current_user != @student and !current_user.admin?
      flash[:success] = 'You can only edit your own profile'
      redirect_to student_path(current_user)
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:success] = 'Only admins can perform that action'
      redirect_to root_path
    end
  end

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end
end
