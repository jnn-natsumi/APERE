class PostsController < ApplicationController
    before_action :authenticate_user!,only: [:create,:edit,:update,:destroy,:index]

	def index
        @user = current_user
        @posts = Post.all
	end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.save
        redirect_to user_path(current_user)
    end

    def edit
    end

    def show
        @post = Post.find(params[:id])
        @user = User.find_by(id: @post.user_id)
    end

    def update
    end

    def destroy
    end

    private
    def post_params
        params.require(:post).permit(:travel_spot, :cost, :tag, :point_a, :point_b, :explanation, :travel_image)
    end
end
