class FavoritesController < ApplicationController
		before_action :authenticate_user!

	def create
		experience = Experience.find(params[:experience_id])
		favorite = current_user.favorites.new(experience_id: experience.id)
		favorite.save
		redirect_to experience_path(experience)
	end

	def destroy
		experience = Experience.find(params[:experience_id])
		favorite = current_user.favorites.new(experience_id: experience.id)
		favorite.destroy
		redirect_to experience_path(experience)
	end
end
