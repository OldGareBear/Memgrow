class Api::FriendshipsController < ApplicationController

  def show
    @friendship = Friendship.find(params[:id])
    render :json => @friendship
  end

  def index
    @friendships = Friendship.all
    render :json => @friendships
  end

  def update
    @friendship = Friendship.find(params[:id])

    if @friendship.update(status: friendship_params[:status])
      render :json => @friendship
    else
      render :json => @friendship.errors, status: :unprocessable_entity
    end
  end

  protected

  def friendship_params
    params.permit(:status)
  end

end
