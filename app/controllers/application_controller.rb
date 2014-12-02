class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def confirm_admin_login
    unless session[:email]
      flash[:notice] = 'Please log in.'
      redirect_to(controller: :access, action: :login)
      return true
    end
  end

  def confirm_user_login
    unless session[:user_id]
      flash[:notice] = 'You need to open up a session using your email  before continuing.'
      redirect_to(controller: :access, action: :login)
      return true
    end
  end

  def logged_in?
    current_user.present?
  end

  def is_admin?
    logged_in? && current_user.is_admin?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end


end
