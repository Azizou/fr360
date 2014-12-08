class AdminsController < ApplicationController

  layout 'admin'

  #only when admin should any action in this class be called
  before_action :confirm_admin_access
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
    redirect_to edit_user_path(current_user)
  end

  def update
    if @admin.update(admin_params)
      flash[:notice] = 'Update successful'
      redirect_to action: :index
    else
      render :edit
    end
  end

  def delete
    @admin = @admin.destroy
    flash[:notice] = "#{@admin.full_name} has been removed successfully"
    redirect_to action: :index
  end

  def index
  end

  def show
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
