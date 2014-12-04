class MembersController < ApplicationController

  before_action :logged_in?

  layout 'member'

  def index
    @users = User.all
  end

  #setting by the member, like changing their password
  def edit
  end

  def update
  end

  def show
    load_feedback(current_user.id)
  end

  def load_feedback(reviewee_id)
    reviews = PerformanceReview.where(reviewee_id: reviewee_id)    #return an array of pr for the current user
    feedbacks = {}
    reviews.each do |x|
      feedbacks[:x.id] = x.feedback
    end
  end
end
