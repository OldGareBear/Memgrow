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
    friendship = Friendship.find(params[:id])
    former_friend_id = friendship.requester_id
    # requester-requestt relationship can go either way
    if former_friend_id == current_user.id
      former_friend_id = friendship.requestee_id
    end

    friendship.destroy
    redirect_to user_url(former_friend_id)
  end

  def index
    @user = User.find(params[:user_id])
    render :index
  end
end
