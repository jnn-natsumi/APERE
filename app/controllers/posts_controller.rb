class PostsController < ApplicationController
    before_action :authenticate_user!,only: [:create,:edit,:update,:destroy,:index]

	def index
        @user = current_user
        @posts = Post.page(params[:page]).per(10).order(created_at: :desc)
        regions = []
        @posts.each do |post|
            regions << post.tag_list
        end
        @regions = regions.uniq
	end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if  @post.save
            redirect_to user_path(current_user)
        else
            render action: :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to post_path(@post.id), notice: "キロクを編集しました！"
        else
            render action: :edit
        end
    end

    def show
        @post = Post.find(params[:id])
        @user = User.find_by(id: @post.user_id)
        @comment = Comment.new
        @comments = @post.comments
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to user_path(current_user)
    end

    private
    def post_params
        params.require(:post).permit(:travel_spot, :cost, :tag, :point_a, :point_b, :explanation, :travel_image, :tag_list)
    end
end
