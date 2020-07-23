class UsersController < ApplicationController
	before_action :authenticate_user!
    before_action :current_user, only: [:edit, :update]

	def show
		@user = User.find(params[:id])
	end

	def index
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
	end

	def favorite
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image_id, :profile, :birthplace)
	end

end