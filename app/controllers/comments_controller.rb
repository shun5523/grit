class CommentsController < ApplicationController
		before_action :authenticate_user!

	def create
		problem = Problem.find(params[:problem_id])
		@comment = current_user.comments.new(comment_params)
		@comment.problem_id = problem.id
		@comment.save
		redirect_to problem_path(problem.id)
	end

	def destroy
		@comment = Comment.find_by(id: params[:id],problem_id: params[:problem_id])
		@comment.destroy
		redirect_to problem_path(@comment.problem.id)
	end

	private
	def comment_params
		params.require(:comment).permit(:user_id, :problem_id, :comment)
	end


end
