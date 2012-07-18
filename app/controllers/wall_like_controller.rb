class WallLikeController < ApplicationController

	def likepost
      user = User.find(:all,:conditions=>["email_id = ?",session[:user_id]])
      walllike = WallLike.where(:user_id => user[0].id,:wall_id => params[:id])
      if walllike.blank?
        like = WallLike.new
        like.user_id = user[0].id
        like.wall_id = params[:id]
        like.save
      end
      redirect_to userprofile_user_path(user[0].id)
	end 
end
