class FriendrequestController < ApplicationController
  before_filter :check_session, :only=>[:index]
  def index
    
  end
  def all_suggess_friends
    @user=User.find(params[:id])
    @friends = @user.friendrequests.select("friend_id").where(:status =>"accepted")
    friends = @friends.map{|s| s.friend_id}
    @friendss = Friendrequest.select("user_id").where(:friend_id=>params[:id], :status =>"accepted")
    friendss = @friendss.map{|s| s.user_id}
    c = friends + friendss 
    @friends_lists = User.find(:all, :conditions => ['id not in (?)',c]) #find all friend list except current_user
    if @friends_lists.blank?
       @friends_lists = User.find(:all, :conditions => ['id not in (?)', @user.id])
    end
  end

  def addfriend 
    @user = User.where(:email_id=> session[:user_id])
    @check_friend = Friendrequest.where(:user_id => @user[0].id, :friend_id => params[:id])
    debugger
    if @check_friend.blank?
       @check_friend_again =Friendrequest.where(:user_id =>params[:id], :friend_id => @user[0].id)     
       if @check_friend_again.blank?
          @friendrequest = Friendrequest.new
          @friendrequest.user_id = @user[0].id
          @friendrequest.friend_id = params[:id]
          @friendrequest.status = "pending"
          if @friendrequest.save
          else
            redirect_to user_index_path
          end
       end    
    end 
      redirect_to  userprofile_user_path(@user[0].id)  
  end
  
  def destroy
    @user = User.where(:email_id => session[:user_id])
    @friendrequest = Friendrequest.where(:user_id=>@user[0].id,:friend_id=>params[:id])
    @friendrequest[0].destroy
    redirect_to userprofile_user_path(@user[0].id)
  end

  def add_friend_into_list
    @user = User.where(:email_id => session[:user_id])
   # Friendrequest.delete_all(["user_id = ? AND friend_id = ? ", @user[0].id, params[:id]])
    Friendrequest.update_all(["status = ?","accepted"], ["user_id = ? and friend_id = ?", params[:id],@user[0].id]) # update friend request status
    redirect_to userprofile_user_path(@user[0].id)
  end

end
