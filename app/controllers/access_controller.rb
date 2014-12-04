class AccessController < ApplicationController

  layout 'public'
  
  def new
    @object = Login.new
  end

  def create
    # Only bother the database if an email and a password are given
    if params[:email].present? && params[:password].present?
      @user = attempt_login(params)
      if @user
        session[:user_id] = @user.id
        if @user.is_type?('Admin')
          redirect_to admins_path and return
        else
          redirect_to members_path and return
        end
      else
        flash[:error] = 'Wrong email/password combination'
        redirect_to root_path
      end
    else
      @object = Login.new
      @object.email = params[:email]
      @object.password = params[:password]
      @object.valid?
      flash[:error] = 'Please login to proceed any further'
      render :'access/new'
    end
  end



  def logout
    session[:user_id] = nil
    flash[:notice] = 'You are now logged out'
    redirect_to root_path
  end

  private
    def attempt_login(params)
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        user
      end
    end
end
