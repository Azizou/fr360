class AdminController < ApplicationController

#  before_action :find_admin, only: [:update, :delete, :show]

  def new
    #@admin=Admin.new
    feedback_form
  end

  def create
    @admin = Admin.create(admin_params)
  end

  def update
    @admin = @admin.update(admin_params)
  end

  def delete
    @admin = @admin.destroy
  end

  def index
    @users = User.all
    render 'users/index'
  end

  def show
  end

  def feedback_form
    @user = User.first
    @performance_review = PerformanceReview.new
    @feedback = Feedback.new
    render :feedback_form
  end

  def create_form
    render :index
  end

  private
  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email )
  end

  def find_admin
    @admin = Admin.find(params[:id])
  end
end
