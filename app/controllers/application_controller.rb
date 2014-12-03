class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?


  def confirm_user_login
    unless logged_in?
      flash[:notice] = 'You need to open up a session using your email  before continuing.'
      redirect_to
      true
    end
  end

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
