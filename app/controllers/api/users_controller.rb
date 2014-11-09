class Api::UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    
    cards_count = 0
    @user.courses.each do |course|
      cards_count += course.cards.count
    end
    @cards_count = cards_count

    @cards_studied, @study_errors = calc_stats(@user)

    render :show
  end
  
  def index
    @users = User.all
    render json: @users
  end
  
  protected
  
  def calc_stats(user)
    correct = 0
    incorrect = 0

    user.user_card_histories.each do |card|
      correct += card.times_right
      incorrect += card.times_wrong
    end

    [incorrect + correct, incorrect]
  end
  
end