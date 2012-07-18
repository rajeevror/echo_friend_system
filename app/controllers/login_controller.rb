class LoginController < ApplicationController

  def dologin
    @user =User.where(:email_id=>params[:email],:password=>params[:password])
    if @user.blank? || @user=='' || @user==nil
       flash[:error] = "Incorrect User name or password"
       redirect_to user_index_path
    else
      session[:user_id]=@user[0].email_id
      redirect_to  userprofile_user_path(@user[0].id)
    end 
  end
 
  def logout
    @users = User.where(:id=>params[:id])
    session[:user_id]=@users[0].email_id
    session[:user_id]=nil
    redirect_to user_index_path
  end
end
