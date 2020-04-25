class StudentCoursesController < ApplicationController
  def create
    course_to_add = Course.find(params[:course_id])
    if current_user.courses.include?(course_to_add)
      flash[:notice] = 'Something was wrong with your enrollment'
      redirect_to root_path
    else
      StudentCourse.create(course: course_to_add, student: current_user)
      flash[:notice] = "You have successfully enrollrd in #{course_to_add.name}"
      redirect_to current_user
    end
  end
end
