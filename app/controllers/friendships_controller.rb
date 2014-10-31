class FriendshipsController < ApplicationController
  before_filter :require_sign_in!

  def create
    requestee = current_user
    requester = User.find(params[:id])
    friendship = Friendship.new(requester_id: requestee.id, requestee_id: params[:id] )

    friendship.save

    redirect_to user_url(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @friend = User.find(params[:friend_id]) # send up from the form
    
    @friendship = User.find_by_requester_id_and_requested_id() #
  end

  def index
    @user = User.find(params[:user_id])
    render :index
  end
end
