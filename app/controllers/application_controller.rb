class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :is_admin?

  def logged_in?
    current_user.present?
  end

  def is_admin?
    logged_in? && current_user.is_type?('Admin')
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end


end
