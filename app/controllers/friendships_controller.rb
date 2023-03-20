class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @friendship = Friendship.new(friendship_params)
    if !@friendship.save
      flash[:notice]= @friendship.errors.full_messages.to_sentence
    end
    redirect_back(fallback_location: profiles_url)

  end

  def destroy
    if current_user.pending.includes(params[:id])
      @friendship = current_user.pending
    end
    @friendship.destroy
    redirect_back(fallback_location: profiles_url)
  end

  def index
    @friends = current_user.friends
  end

  private
  
  def friendship_params
    params.require(:friendship).permit(:confirmed, :sender_id, :recipient_id)
  end
end
