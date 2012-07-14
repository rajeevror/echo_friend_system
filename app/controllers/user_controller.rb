class UserController < ApplicationController
  before_filter :check_session, :only=>[:userprofile,:edit,:update]
 
  def index
  end

  def new
    @user = User.new
  end

  def create
    @users = User.new(params[:user])
    if @users.save
      session[:user_id]=@users.email_id
      redirect_to userprofile_user_path(@users.id)
    else
      redirect_to new_user_path
    end
  end
  





  def userprofile
    @user=User.find(params[:id])
    @friend_request_id = Friendrequest.select("user_id").where(:friend_id=>@user.id , :status=>"pending")
    @friend_request_name = User.where(:id => @friend_request_id.map{|s| s.user_id}) # pending request 
    @friends = @user.friendrequests.select("friend_id").where(:status =>"accepted")
    friends = @friends.map{|s| s.friend_id}
    @friendss = Friendrequest.select("user_id").where(:friend_id=>params[:id], :status =>"accepted")
    friendss = @friendss.map{|s| s.user_id}
    c = friends + friendss
    @friends_lists = User.find(:all, :conditions => ['id not in (?)',c]) #find all friend list except current_user
    if @friends_lists.blank?
       @friends_lists = User.find(:all, :conditions => ['id not in (?)', @user.id])
    end
      @friends = @user.friendrequests.select("friend_id").where(:status =>"accepted")
      friends = @friends.map{|s| s.friend_id}
      @friendss = Friendrequest.select("user_id").where(:friend_id=>params[:id], :status =>"accepted")
      friendss = @friendss.map{|s| s.user_id}
      c = friends + friendss
      @friend_added_id = @user.friend_added_lists.uniq
      @friend_added_name=User.where(:id => c)
  end
  

  #edit profile
  def edit
    @user = User.find(params[:id])
  end

 #update profile
  def update
    @user = User.find(params[:id])
    @users=User.where(:id=>params[:id])
    session[:user_id]=@users[0].email_id
    if @user.update_attributes(params[:user])
      redirect_to userprofile_user_path(@user.id)
    else
      render edit_user(@user)
    end
  end

end
