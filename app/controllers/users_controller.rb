class UsersController < ApplicationController
  before_filter :require_sign_in!, except: [:new]

  def create
    @user = User.new(user_params)

    at_index = @user.email.index("@")
    @user.username = @user.email[0, at_index]

    if @user.save!
      sign_in(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def index
    @users = User.all # maybe make this page available to only admin?
    render :index
  end

  def show
    @user = User.find(params[:id])

    # find the number of words the user is studying
    cards_count = 0
    @user.courses.each do |course|
      cards_count += course.cards.count
    end
    @cards_count = cards_count

    # find the stats for the user
    @cards_studied, @study_errors = calc_stats(@user)

    # generate the leaderboard
    @leaders = @user.friends.sort_by(&:points)[0, 10]

    render :show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      redirect_to users_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id]) # definitely require admin status
    @user.destroy
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

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
