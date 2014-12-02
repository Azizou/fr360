class AdminsController < ApplicationController

  layout 'admin'

  before_action :find_admin, only: [:edit, :update, :delete, :show]
  before_action :confirm_admin_login

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = 'Admin created successfully!'
      redirect_to action: 'index'
    else
      flash[:notice] = 'Unable to create admin, please retry'
      render action: :new
    end
  end

  def edit
  end

  def update

    if @admin.update(admin_params)
      flash[:notice] = 'Update successful'
      redirect_to action: :index
    end
  end

  def delete
    @admin = @admin.destroy
    flash[:notice] = "#{@admin.full_name} has been removed successfully"
    redirect_to action: :index
  end

  def index
    @admins = Admin.all
    render action: :index
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
    params.require(:admin).permit(:first_name, :last_name, :email, :password )
  end
  private
    def find_admin
      @admin = Admin.find(params[:id])
    end
end
