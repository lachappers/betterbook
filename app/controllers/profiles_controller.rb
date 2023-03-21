class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ edit update destroy show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :show]
  
  def new
    # @profile = Profile.new
  end

  def create
    # @profile = Profile.create!(profile_params)
  end

  def show
    @profile = Profile.find(params[:id])
    # @friends = current_user.friends
    @friendship = current_user.get_friendship( @profile.user)
    p @friendship
    # @pending_requests = current_user.sent_requests
    # @friend_requests = current_user.received_requests
  end

  def index
  end

  def edit

  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    # image.purge
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    #users can see all profiles
    @profile = Profile.find(params[:id])
    #users can only see their own profiles
    # @profile = current_user.profiles.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :username, :id)
  end

  def friendship_params
    params.require(:friendship).permit(:id)
  end
end
