class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @friendship = Friendship.new(friendship_params)
  end

  def destroy
    # @friendship = current_user.friendships.find_by(status: false)
  end

  def index
    @friends = current_user.friends
  end

  private
  
  def friendship_params
    params.require(:friendship).permit(:pending, :sender_id, :recipient_id)
  end
end
