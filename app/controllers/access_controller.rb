class AccessController < ApplicationController
  layout 'public'

  #before_action :confirm_admin_login, except: [:login, :logout, :index]
  def index
    #intro page, like the admin dashboard
  end

  def login
    #login form
  end

  def attempt_login
    @user_found = User.find_by(email: params[:email])
    if @user_found
      session[:user_id] = @user_found[:user_id]
      redirect_to controller: 'users', action: 'index'
    else
      render 'login'
    end
  end

  def admin_login
    render 'admin_login'
  end

  def admin_attempt_login
    if params[:email].present? && params[:password].present?
      found_admin = Admin.find_by(email: params[:email]).first
      if found_admin
        authorized = found_admin.authenticate(params[:password])
      end
      if authorized
        session[:email] = authorized.email
        session[:user_id] = authorized.id
        flash[:notice] = 'Logged in successfully'
        redirect_to action: 'index'
      else
        flash[:notice] = 'Invalid email/password combination'
      end
    end
  end

  def logout
    session[:user_id] = nil
    session[:email] = nil
    flash[:notice] = 'Successfully logged out'
    redirect_to action: :login
  end

  def confirm_admin_login
    unless session[:user_id]
      flash[:notice] = 'Please log in.'
      redirect_to(controller: :access, action: 'login')
      return true
    end
  end
end
