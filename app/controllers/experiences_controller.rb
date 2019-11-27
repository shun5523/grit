class ExperiencesController < ApplicationController
		before_action :authenticate_user!, only: [:show, :edit, :update, :destroy, :new, :create]

	def index
		@experiences = Experience.page(params[:page]).reverse_order
		@experiences = Experience.search(params[:search]).page(params[:page]).reverse_order
		@all_ranks = Experience.find(Favorite.group(:experience_id).order('count(experience_id) desc').limit(3).pluck(:experience_id))
	end

	def new
		@experience = Experience.new
		# @experience_picture = ExperincePicture.new
	end

	def create
		@experience = Experience.new(experience_params)
		@experience.user_id = current_user.id



	respond_to do |format|

      if @experience.save
        format.html { redirect_to experiences_path, notice: 'Map was successfully created.' }
        format.json { render :show, status: :created, location: @experience }
      else
        format.html { render :new }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end

		# if @experience.save
		# 	redirect_to experiences_path
	 #    else
	 #    	render :new
		# end
	end

	def show
		@experience = Experience.find(params[:id])
		@user = @experience.user

	end

	def edit
		@experience = Experience.find(params[:id])
	end

	def update
		 @experience = Experience.find(params[:id])

	    respond_to do |format|
	      if @experience.update(experience_params)
	        format.html { redirect_to experience_path(@experience), notice: 'Map was successfully updated.' }
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
		redirect_to experiences_path
	end

  private
	def experience_params
		params.require(:experience).permit(:user_id, :title, :body, :address, :latitude, :longitude)
	end

end
