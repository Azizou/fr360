class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :is_admin?, :them

  def logged_in?
    current_user.present?
  end

  def them
    is_admin? ? 'info':'success'
  end

  def is_admin?
    logged_in? && current_user.is_type?('Admin')
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def load_feedback(reviewee_id)
    reviews = PerformanceReview.where(reviewee_id: reviewee_id)    #return an array of pr for the current user
    feed_backs = []
    reviews.each do |review|
      review.feedbacks.each do |f|
        feed_backs << f
      end
    end
    feed_backs
  end


end
