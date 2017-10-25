class FriendshipsController < ApplicationController
  def index
  end

  def new
  end

  def create
    friendship = Friendship.new
    friendship.user = current_user
    friendship.friend = User.find(params[:id])
    friendship.save
    return redirect_to items_path
  end

  def show
  end

  def edit
      
  end

  def update
  end

  def delete
    friendships1 = Friendship.where(friend_id: params[:user_id])
    puts friendships1
    friendships2 = Friendship.where(user_id: params[:user_id])
    puts friendships2
    @friendships = friendships1 + friendships2
    @friendships.each do |fs| 
      if fs.user_id == current_user.id 
        fs.delete
        return redirect_to items_path
      elsif fs.friend_id == current_user.id
        fs.delete
        return redirect_to items_path
      end  
    end  
  end
end
