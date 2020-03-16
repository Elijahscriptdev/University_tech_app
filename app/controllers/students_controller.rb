class StudentsController < ApplicationController
    def index
        @students = Student.all
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            flash[:success] = "You have successfully signed up #{@student.name}"
            redirect_to root_path
        else
            render 'new'
        end
    end

    # def edit
    # end

    # def update
    #     if @user.update(user_params)
    #         flash[:success] = "Your Account was successfully edited"
    #         redirect_to articles_path
    #     else
    #         render 'new'
    #     end
    # end

    # def show
    #     @user_articles =@user.articles.paginate(page: params[:page], per_page: 5)
    # end

    # def destroy
    #     @user = User.find(params[:id])
    #     @user.destroy
    #     flash[:danger] = "User and Article was successfully deleted"
    #     redirect_to users_path
    # end

    private

    # def set_user
    #      @user = User.find(params[:id])
    # end

    # def require_admin
    #     if current_user != @user and !current_user.admin?
    #         flash[:danger] = "Only admins canperform that action"
    #     redirect_to root_path
    #     end
    # end

    def student_params
        params.require(:student).permit(:name, :email)
    end

    # def require_same_user
    #     if current_user != @user and !current_user.admin?
    #         flash[:danger] = "You can only edit your own information"
    #     redirect_to root_path
    #     end
    # end
end
