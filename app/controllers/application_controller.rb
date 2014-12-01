class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def confirm_admin_login
    unless session[:email]
      flash[:notice] = 'Please log in.'
      redirect_to(controller: :access, action: :login)
      return true
    end
  end

  def confirm_user_login
    unless session[:user_id]
      flash[:notice] = 'Please log in to continue.'
      redirect_to(controller: :access, action: :login)
      return true
    end
  end

end
