class FriendshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    @friendship = Friendship.new(friendship_params)
    if !@friendship.save
      flash[:notice]= @friendship.errors.full_messages.to_sentence
    end
    redirect_back(fallback_location: root_url)

  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    redirect_back(fallback_location: root_url)
  end

  def index
    @friends = current_user.friends
  end

  def edit
    @friendship = Friendship.find(params[:id])
  end

  def update
    @friendship = Friendship.find(params[:id])
    if @friendship.update(friendship_params)
      redirect_back(fallback_location: root_url)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  
  def friendship_params
    params.require(:friendship).permit(:confirmed, :sender_id, :recipient_id)
  end

  # def get_friendship_from_friends(user)
  #   if current_user.friendships_as_recipient.include?(sender: user)
  #     current_user.friendships_as_recipient.find_by(sender: user)
  #   else
  #     current_user.friendships_as_sender.find_by(recipient: user)
  #   end
  # end

end
