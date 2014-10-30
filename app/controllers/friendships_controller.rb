class FriendshipsController < ApplicationController
  def create
    requestee = current_user
    requester = User.find(params[:id])
    friendship = Friendship.new(requester_id: requestee.id, requestee_id: params[:id] )

    friendship.save

    redirect_to user_url(requestee)
  end

  def destroy
  end

  def index
    @user = User.find(params[:user_id])
    render :index
  end
end
