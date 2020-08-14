class LikesController < ApplicationController

	def create
		post = Post.find(params[:post_id])
		like = current_user.likes.new(post_id: post.id)
		# like.user_id = current_user.id
		# like.post_id = params[:params_id]
		like.save
		redirect_to request.referrer
	end

	def destroy
		post = Post.find(params[:post_id])
		like = current_user.likes.find_by(post_id: post.id)
		like.destroy
		redirect_to request.referrer
	end

	def index
		@like_posts = current_user.like_posts
	end

end
