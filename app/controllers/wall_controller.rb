class WallController < ApplicationController
 def post_wall
  end

  def new
  	@user = User.find(:all,:conditions=>["email_id = ?",session[:user_id]])
  	@wall = Wall.new
    render :layout => false
  end

  def create
    @wall = Wall.new(params[:wall])
    if @wall.save
      user = User.find(:all,:conditions=>["email_id = ?",session[:user_id]])
      @post = Wall.where(:user_id=>user[0].id).last
      #render :text=>"#{post.post_wall}"
     # 
      #redirect_to userprofile_user_path(user[0].id)
    else
      redirect_to new_user_path
    end
  end
end
