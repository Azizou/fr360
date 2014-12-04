class MembersController < ApplicationController

  before_action :logged_in?

  layout 'member'

  def index
    @users = User.all

  end

  def edit
  end

  def update
  end

  def show
  end
end
