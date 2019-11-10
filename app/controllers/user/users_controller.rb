class User::UsersController < ApplicationController
	def show
		@user = User.where(id: params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
	end

	def destroy
	end

end
