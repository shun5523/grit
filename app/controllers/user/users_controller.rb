class User::UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		user = User.new(user_params)
		user.save
		visit = Visit.new(visit_params)
		visit.user_id = user.user_id
	end

	def destroy
	end

  private
	def user_params
		params.require(:user).permit(:user_name, :age, :sex, :user_image_id, :password, :mail_address, :introduction)
	end
	def visit_params
		params.require(:user).permit(:country_id)
	end
end

