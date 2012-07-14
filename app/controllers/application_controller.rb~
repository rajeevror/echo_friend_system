class ApplicationController < ActionController::Base
  protect_from_forgery
  def check_session
    if session[:user_id]==nil
       redirect_to new_user_path
    else 
      return true
    end
  end
  
  def check_session_after
    if session[:user_id]==nil
       redirect_to new_user_path
    else 
      @user = User.where(:email_id => session[:user_id])
      redirect_to userprofile_user_path(@user[0].id)
    end
  end
end
