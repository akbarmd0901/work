class LikesController < ApplicationController
	before_action :find_like, only: [:destroy]
	
	def create
	 @like = current_user.likes.new(like_params)
	 if :@like.save
	 	flash[:notice] = @like.errors.full_message.to_sentence
	 end
	  redirect_to @like.video
	end

	 def destroy
		like = current_user.likes.find(params[:id])
		video = @like.video
		@like.destroy
		redirect_to video 
	 end


	 private
	 def like_params
	  params.require(:like).permit(:video_id)
	 end
	
end
