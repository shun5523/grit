class User::ProblemsController < ApplicationController
	before_action :authenticate_user!

	def index
		@problems = current_user.problems.page(params[:page]).reverse_order
	end

	def show
		@problem = Problem.find(params[:id])
		@user = @problem.user
		@comment = Comment.new
	end

	def edit
		@problem = Problem.find(params[:id])
	end

	def update
		 @problem = Problem.find(params[:id])
      if @problem.update(problem_params)
         # flash[:notice] = "the Book was successfully edited"
         redirect_to user_problem_path(@problem)
      else
         render :edit
      end

	end

	def destroy
		@problem = Problem.find(params[:id])
		@problem.destroy
		redirect_to user_problems_path
	end

  private
	def problem_params
		params.require(:problem).permit(:user_id, :title, :body, :genre)
	end
end
