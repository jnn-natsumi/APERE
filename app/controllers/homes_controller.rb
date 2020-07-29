class HomesController < ApplicationController

	def top
		@posts = Post.all
		@user = current_user
		regions = []
        @posts.each do |post|
            regions << post.tag_list
        end
        @regions = regions.uniq
        if params[:tag_name]
            @posts = Post.tagged_with("#{params[:tag_name]}")
        end
	end

	def about
	end

	def myprofile
	end

	def map
		results = Geocoder.search(params[:address])
		@latlng = results.first.coordinates

	  	respond_to do |format|
  			format.js
  		end
	end


	private
    def post_params
        params.require(:post).permit(:travel_spot, :cost, :tag, :point_a, :point_b, :explanation, :travel_image, :tag_list)
    end

    def user_params
		params.require(:user).permit(:name, :profile_image, :profile, :birthplace)
	end

end
