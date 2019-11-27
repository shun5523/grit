class Admin::ExperiencesController < ApplicationController
	before_action :authenticate_admin!
	def index
		@experiences = Experience.page(params[:page]).reverse_order
	end

	def show
		@experience = Experience.find(params[:id])
	end

	def edit
		@experience = Experience.find(params[:id])
	end

	def update
		 @experience = Experience.find(params[:id])
	    respond_to do |format|
	      if @experience.update(experience_params)
	        format.html { redirect_to admin_experience_path(@experience), notice: 'Map was successfully updated.' }
	        format.json { render :show, status: :ok, location: @experience }
	      else
	        format.html { render :edit }
	        format.json { render json: @experience.errors, status: :unprocessable_entity }
	      end
		end

	end

	def destroy
		@experience = Experience.find(params[:id])
		@experience.destroy
		redirect_to admin_experiences_path
	end

  private
	def experience_params
		params.require(:experience).permit(:user_id, :title, :body)
	end
end
