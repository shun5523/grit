class ProblemsController < ApplicationController
		before_action :authenticate_user!,  only: [:show, :edit, :update, :destroy, :new, :create]

	def index
		@problems = Problem.page(params[:page]).reverse_order
	    @problems = Problem.title_search(params[:search]).page(params[:page]).reverse_order
	end

	def new
		@problem = Problem.new
	end

	def create
		@problem = Problem.new(problem_params)
		@problem.user_id = current_user.id

		if @problem.save
			redirect_to problems_path
	    else
	    	render :new
		end

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
         redirect_to problem_path(@problem)
      else
         render :edit
      end

	end

	def destroy
		@problem = Problem.find(params[:id])
		@problem.destroy
		redirect_to problems_path
	end

  private
	def problem_params
		params.require(:problem).permit(:user_id, :title, :body, :genre)
	end
end
