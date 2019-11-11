class Admin::ProblemsController < ApplicationController
	def index
		@problems = Problem.all
	end

	def show
		@problem = Problem.find(params[:id])
	end

	def edit
		@problem = Problem.find(params[:id])
	end

	def update
		 @problem = Problem.find(params[:id])
      if @problem.update(problem_params)
         # flash[:notice] = "the Book was successfully edited"
         redirect_to problem_path(@problem)
      else
         render :edit
      end

	end

	def destroy
	end

	  private
	def problem_params
		params.require(:problem).permit(:user_id, :title, :body, :genre)
	end
end
