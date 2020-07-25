class UsersController < ApplicationController
	before_action :authenticate_user!
    before_action :current_user, only: [:edit, :update]

	def show
		@user = User.find(params[:id])
		@posts = @user.posts
	end

	def index
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user), notice: "マイページを変更いたしました！"
		else
			render action: :edit
		end
	end

	def favorite
		@user = User.find(params[:id])
	end

  # フォロー・フォロワー一覧の実装
  # フォローしている ＝ follows,following
    def follows
	    user = User.find(params[:id])
	    @user = User.find(params[:id])
	    @users = user.followings
    end

  # フォローされている ＝ followers
    def followers
	    user = User.find(params[:id])
	    @user = User.find(params[:id])
	    @users = user.followers
    end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :profile, :birthplace)
	end

end