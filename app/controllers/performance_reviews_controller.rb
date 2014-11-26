class PerformanceReviewsController < ApplicationController
  def index
    @users = User.all
    render 'users/index'
  end

  def new
    @user = User.first
    @questions = Question.sorted
    @performance_review = PerformanceReview.new
    @performance_review.user_id = @user.id
    Question.all.each do |question|
      @performance_review.feedbacks.build(question_id: question.id)
    end
  end

  def create
    #raise params.to_yaml

    @performance_review = PerformanceReview.new(review_params)
    if @performance_review.save
      flash[:notice] = 'Successfully saved PR'
      @users = User.all
      render 'users/index'
    else
      flash[:notice] = 'Failed to save PR to persistent db'
      render :new
    end
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
    params.require(:performance_review).permit(:feedbacks_attributes)
  end
end
