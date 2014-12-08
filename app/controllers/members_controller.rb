class MembersController < ApplicationController

  before_action :logged_in?

  layout 'member'

  def index
    @team = current_user.team
    if @team
      @users = User.where(team_id: @team.id)
    else
      @users = User.all
    end
  end

  #setting by the member, like changing their password
  def edit
  end

  def update
  end

  def show
    @feedbacks = load_feedback(current_user.id)
    @questions = Question.all
    if is_admin?
      render layout: 'admin'
    end
  end
end
