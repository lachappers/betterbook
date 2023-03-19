class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)
  end

  def destroy
    
  end

  def index
    @friends = current_user.friends
  end

  private
  
  def friendship_params
    params.require(:friendship).permit(:pending, :sender_id, :recipient_id)
  end
end
