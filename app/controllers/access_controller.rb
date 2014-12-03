class AccessController < ApplicationController

  layout 'public'
  
  def new
    @login = Login.new(params)
  end

  def create
    # Only bother the database if an email and a password are given
    if params[:email].present? && params[:password].present?
      login = Login.new(params)

      if login.id?
        session[:user_id] = login.id
        if User.find(session[:id]).is_type?('Admin') #.is_type?('Admin')
          redirect_to admins_path and return
        else
          redirect_to users_path and return
        end
      else
        flash[:error] = 'Wrong email/password combination'
        render 'login'
      end
    else
      flash[:error] = 'Please enter your email and password'
      render 'login'
    end
  end



  def logout
    session[:user_id] = nil
    session[:email] = nil
    flash[:notice] = 'Successfully logged out'
    redirect_to action: :new
  end

  #before_action :confirm_admin_login, except: [:login, :logout, :index]

=begin
  def index
    #intro page, like the admin dashboard
  end

  def login
    if session[:email]
      redirect_to admins_path
    elsif session[:user_id]
      flash[:notice] = 'You do not have access to that page'
      redirect_to users_path
    end
    #login form
  end


  def attempt_login
    user = User.find_by




    user_found = User.find_by(email: params[:email])
    if user_found
      session[:user_id] = user_found.id
      #session[:username] = user_found.first_name.capitalize
      redirect_to users_path
    else
      redirect_to root_url
    end
  end

  def admin_login
    render 'admin_login'
  end

  def attempt_login
    authorized = nil
    if params[:email].present? && params[:password].present?
      found_admin = Admin.find_by(email: params[:email])
      if found_admin
        authorized = found_admin.authenticate(params[:password])
      end
      if authorized
        session[:email] = authorized.email
        session[:user_id] = authorized.id
        flash[:notice] = 'Logged in successfully'
        redirect_to controller: :admins, action: :index
      else
        flash[:notice] = 'Invalid email/password combination'
        render 'admin_login'
      end
    end
  end
=end
end
