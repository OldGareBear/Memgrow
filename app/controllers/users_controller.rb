class UsersController < ApplicationController
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
end
