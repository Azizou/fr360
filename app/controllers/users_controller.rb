class UsersController < ApplicationController

  before_action :find_user, only: [:edit, :show, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def update
    @user = @user.update user_params
  end

  def create
    @user = User.create user_params
  end

  def delete
    @user  = @user.destroy
  end

  def show
  end

  def edit
  end

  def find_user
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :completed)
  end
end
