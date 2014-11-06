# class Api::FriendshipsController < ApplicationController
#
#   def destroy
#     @friendship =
#       Friendship.find_by_requester_id_and_requestee_id(
#         current_user.id,
#         params[:friend_id]
#       )
#     # must account for fact that the requester-requestee relationship can go
#     # either way
#     unless @friendship
#       @friendship =
#         Friendship.find_by_requester_id_and_requestee_id(
#           params[:friend_id],
#           current_user.id
#         )
#     end
#
#     @friendship.destroy
#
#     render :json => @friendship
#   end
#
#   protected
#
#   def friendship_params
#     params.permit(:friend_id)
#   end
#
# end

# must implement this if I want to be able to delete users from backbone
