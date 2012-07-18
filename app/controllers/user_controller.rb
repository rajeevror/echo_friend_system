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
      @friend_added_name=User.where(:id => c)
      abc = c << params[:id].to_i # all joined friend id
      @wall_user_id = Wall.find(:all)
      walls = @wall_user_id.map{|s| s.user_id}
      @hash = Hash.new
      for i in 0...abc.length
        wall = Wall.where(:user_id => abc[i]) # find all user_id from wall model
        unless wall.blank? #check
          for j in 0...wall.length  
            walllike = WallLike.where(:user_id => abc[i],:wall_id=>wall[j].id)
            if walllike.blank?
             # @hash[User.where(:id=>abc[i])]= {"#{wall[j].post_wall}"=>{"#{wall[j].id}"=>"like"}}
#######################################
# <% @hash.each do |key,value| %>
   #  <%= key[0].user_name %>  
   #  <% value.each do |v,id| %><%= v %>   
    # <% id.each do |x,y| %>
     #<%= link_to "#{y}", likepost_wall_like_path(x) %> <p>
     # <% end %>
     # <% end %>
     #<% end %>

               else
             # @hash[User.where(:id=>abc[i])]= {"#{wall[j].post_wall}"=>{"#{wall[j].id}"=>"unlike"}}
            end
           end
        end
      end
      
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
