class ProblemsController < ApplicationController
	def index
		@problems = Problem.all
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
	end

	def edit
		@problem = Problem.find(params[:id])

	end

	def update
		 @problem = Problem.find(params[:id])
         @problem.user_id = current_user.id
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
