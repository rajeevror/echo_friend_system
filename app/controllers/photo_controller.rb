class PhotoController < ApplicationController

  def post_photo
  end

  def new
   
    @user = User.find(:all,:conditions=>["email_id = ?",session[:user_id]])
  	@photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:photo])
    if @photo.save
      #session[:user_id]=@users.email_id
      #redirect_to userprofile_user_path(@users.id)
      render :text => 'kdjyvdh'
    else
      redirect_to new_user_path
    end
  end

end
