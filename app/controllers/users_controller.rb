class UsersController < ApplicationController

  #refactor for actions that requires an object from it's id


  layout 'admin'

  before_action :logged_in?
  before_action :find_user, only: [:edit, :show, :update, :destroy]

  #layout setLayout

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
  end

  def update
    #saved =  @user.update(user_params)

    if @user.update(user_params)
      flash[:notice] = 'Update was successfully.'
      if is_admin?
        render :action => :show, id: @user.id
      else
        redirect_to members_path
      end
    else
      #flash[:error] = 'Attempt to update user details failed, try again'
      render :edit
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = "User #{@user.full_name} has been successfully added"
      render :action => :show, id: @user.id
    else
      #flash[:notice] = 'Attempt to add a new user failed, try again'
      render :new
    end
  end

  def destroy
    @user  = @user.destroy
    flash[:notice] = "User #{@user.full_name} has been successfully added"
    redirect_to action: :index
  end

  def show
  end

  def review
    @feedbacks = load_feedback(params[:id])
    @questions = Question.all
    render 'members/show'
  end

  def edit
    unless is_admin?
      render :layout => 'member'
    end
  end

  def find_user
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
