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
    @feedbacks = load_feedback(current_user.id)
    @questions = Question.all
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
