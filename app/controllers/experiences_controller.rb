class ExperiencesController < ApplicationController
	def index
		@experiences = Experience.all
	end

	def new
		@experience = Experience.new
	end

	def create
		#render plain: params[:experience].inspect
		@experience = Experience.new(experience_params)
		@experience.user_id = current_user.id

		if @experience.save
			redirect_to experiences_path
	    else
	    	render :new
		end
	end

	def show
		@experience = Experience.find(params[:id])
	end

	def edit
		@experience = Experience.find(params[:id])
	end

	def update
		 @experience = Experience.find(params[:id])
         @experience.user_id = current_user.id
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
