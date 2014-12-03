class AdminsController < ApplicationController

  layout 'admin'

  #only when admin should any action in this class be called
  before_action :is_admin?
  before_action :find_admin, only: [:edit, :update, :delete, :show]

  def new
    @admin = Admin.new
    render 'new'
  end

  def create
    @admin = Admin.new(admin_params)
    if @admin.save
      flash[:notice] = 'A new admin has been created successfully!'
      redirect_to action: 'index'
    else
      flash[:error] = 'Unable to create admin, please retry'
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
    render  'index'
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
