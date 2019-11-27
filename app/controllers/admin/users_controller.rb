class Admin::UsersController < ApplicationController
	before_action :authenticate_admin!

	def index
		@users = User.page(params[:page]).reverse_order
	end

	def show
		@user = User.find(params[:id])
		@visit = Visit.where(user_id: @user.id)
	end

	def edit
		@user = User.find(params[:id])
		@user.countries.build
	end

	def update
		user = User.find(params[:id])
		user.update(user_params)
		redirect_to admin_users_path
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to admin_users_path
	end

  private
	def user_params
		params.require(:user).permit(:user_name, :age, :sex, :user_image, :password, :mail_address, :introduction,
		 { :country_ids=> []})
	end

end
