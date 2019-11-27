class TopController < ApplicationController
	def top
		@all_ranks = Experience.find(Favorite.group(:experience_id).order('count(experience_id) desc').limit(3).pluck(:experience_id))
		@problems = Problem.all.order(created_at: :desc)
	end

private
	def experience_params
		params.require(:experience).permit(:user_id, :title, :body, :address, :latitude, :longitude)
	end
end
