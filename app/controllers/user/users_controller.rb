class User::UsersController < ApplicationController
	before_action :authenticate_user!

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
		# if Visit.exists?(user_id: current_user.id)
		# 	user_countries = user.countries
		# 	user_countries.each do |country|
		# 		if Visit.where(user_id: current_user.id, country_id: country.id).count > 2
		# 			Visit.where(user_id: current_user.id, country_id: country.id).delete_all
		# 			@visit = Visit.create(user_id: user.id,country_id: country.id)
		# 		end
		# 	end
		# end
# idの持ってきかた
		# @visit = Visit.new(user_id: 1, country_id: 9)
		redirect_to user_user_path(current_user.id)
	end

	def destroy
		@user = User.find(params[:id])
	  if @user.destroy
	  	redirect_to root_path
	  else
	  	render :edit
	  end
	end

  private
	def user_params
		params.require(:user).permit(:user_name, :age, :sex, :user_image, :password, :mail_address, :introduction,
		 { :country_ids=> []})
	end
end

