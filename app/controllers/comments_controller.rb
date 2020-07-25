class CommentsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@comment = current_user.comments.new(comment_params)
		@comment.post_id = @post.id
		if @comment.save
			redirect_to post_path(@post), notice: "コメントを送信しました！"
		else
			@user = User.find_by(id: @post.user_id)
			@comments = @post.comments
			render "posts/show"
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end

end
