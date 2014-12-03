class AccessController < ApplicationController

  layout 'public'
  
  def new
  end

  def create
    # Only bother the database if an email and a password are given
    if params[:email].present? && params[:password].present?
      #attempt_login(params)


      @user = attempt_login(params)
      if @user
        session[:user_id] = @user.id
        if @user.is_type?('Admin')
          redirect_to admins_path and return
        else
          redirect_to users_path and return
        end
      else
        flash[:error] = 'Wrong email/password combination'
        render 'new'
      end
    else
      flash[:error] = 'Please login to proceed'
      redirect_to action: :new
    end
  end



  def logout
    session[:user_id] = nil
    flash[:notice] = 'You are now logged out'
    render 'new'
  end

  private
    def attempt_login(params)
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        user
      end
=begin
      else
        false
      end
=end
    end
end
