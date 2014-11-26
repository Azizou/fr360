class PerformanceReviewsController < ApplicationController
  def index
    @users = User.all
    render 'users/index'
  end

  def new
    @user = User.first
    @performance_review = PerformanceReview.new
  end

  def create
    @performance_review = PerformanceReview.new(review_params)
  end

  def show
  end

  def edit
    render :'performance_reviews/edit'
  end

  def update
  end

  def delete
  end

  def review_params
    params.require(:performance_review).permit(:feedback)
  end
end
