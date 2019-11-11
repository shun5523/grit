class CommentsController < ApplicationController
	def create
		problem = Problem.find(params[:problem_id])
		@comment = current_user.comments.new(comment_params)
		@comment.problem_id = problem.id
		@comment.save
		redirect_to problem_path(problem.id)
	end

	def destroy
	end

	private
	def comment_params
		params.require(:comment).permit(:user_id, :problem_id, :comment)
	end


end
