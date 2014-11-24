class AdminController < ApplicationController

  before_action :find_admin, only: [:update, :delete, :show]

  def new
    @admin=Admin.new
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
    @admins =Admin.all
  end

  def show
    render :show
  end

  private
  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email )
  end

  def find_admin
    @admin = Admin.find(params[:id])
  end
end
