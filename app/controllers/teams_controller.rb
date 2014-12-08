class TeamsController < ApplicationController

  layout 'admin'

  before_action :confirm_admin_access
  before_action :find_team, only: [:show, :edit, :update, :delete]

  def index
    unless is_admin?
      redirect_to members_path
    end
    @teams = Team.where(admin_id: current_user.id)
  end

  def show
    @users = @team.users
    render 'users/index'
  end

  def new
    @team = Team.new
    @team.admin_id = current_user.id
    5.times do
      @team.users.build
    end
  end

  def create
    @team = Team.new(team_params)
    @team.admin = current_user
    if @team.save
      flash[:notice] = 'Team created successfully!'
      redirect_to teams_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
  def find_team
    @team = Team.find(params[:id])
  end

  private
  def team_params
    params.require(:team).permit(:title, users_attributes: [:first_name, :last_name, :email, :password, :password_confirmation])
  end
end
