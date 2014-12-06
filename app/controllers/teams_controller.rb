class TeamsController < ApplicationController
  def index
    @teams = Team.where(admin_id: current_user.id)
  end

  def show
  end

  def new
    @team = Team.new
    3.times do
      @team.users.build
    end
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      flash[:notice] = 'Team created successfully!'
      render teams_path
    else
      render new
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
