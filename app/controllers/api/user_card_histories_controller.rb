class Api::UserCardHistoriesController < ApplicationController
  def update
    @history = UserCardHistory.find(params[:id])

    if @history.update(self.history_params)
      render :json => @history
    else
      render :json => @history.errors, :status => :unprocessable_entity
    end
  end

  protected

  def history_params
    params.permit(:user_id, :card_id, :times_wrong, :times_right, :last_studied, :times_right_since_last_mistake)
  end
end
