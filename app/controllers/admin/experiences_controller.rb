class Admin::ExperiencesController < ApplicationController
	def index
		@experiences = Experience.all
	end

	def show
		@experience = Experience.find(params[:id])
	end

	def edit
		@experience = Experience.find(params[:id])
	end

	def update
		 @experience = Experience.find(params[:id])
      if @experience.update(experience_params)
         # flash[:notice] = "the Book was successfully edited"
         redirect_to experience_path(@experience)
      else
         render :edit
      end

	end

	def destroy
	end

  private
	def experience_params
		params.require(:experience).permit(:user_id, :title, :body)
	end
end
