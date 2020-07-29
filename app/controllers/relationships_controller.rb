class RelationshipsController < ApplicationController

	# follow フォローしている follower フォローされてる
	def create
  	follow = current_user.active_relationships.build(follower_id: params[:user_id])
  	follow.save
  	redirect_to request.referrer
		# request.referrerで１つ前のURLを返す。
  end

  def destroy
  	follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
  	follow.destroy
  	redirect_to request.referrer
  end

end
