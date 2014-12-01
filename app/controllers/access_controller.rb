class AccessController < ApplicationController
  layout 'public' , except: :index

  #before_action :confirm_admin_login, except: [:login, :logout, :index]
  def index
    #intro page, like the admin dashboard
  end

  def login
    #login form
  end

  def attempt_login
    user_found = User.find_by(email: params[:email])
    if user_found
      session[:user_id] = user_found.id
      session[:username] = user_found.first_name.capitalize
      redirect_to controller: 'users', action: 'index'
    else
      render 'login'
    end
  end

  def admin_login
    render 'admin_login'
  end

  def admin_attempt_login
    authorized = nil
    if params[:email].present? && params[:password].present?
      found_admin = Admin.where(email: params[:email]).first
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
        render 'admin_login'
      end
    end
  end

  def logout
    session[:user_id] = nil
    session[:email] = nil
    flash[:notice] = 'Successfully logged out'
    redirect_to action: :login
  end
end
