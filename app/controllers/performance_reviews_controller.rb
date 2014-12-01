class PerformanceReviewsController < ApplicationController

  before_action :confirm_user_login

  def index
    @user = User.find(params[:user_id])
    render 'index'
  end

  def new

    #raise review_params.to_yaml

    @user = User.find(params[:user_id])#params[:user_id])
    @questions = Question.sorted
    @performance_review = PerformanceReview.new
    @performance_review.user_id = @user.id
    Question.all.each do |question|
      @performance_review.feedbacks.build(question_id: question.id)
    end
    render :new
  end

  def create
    #raise review_params.to_yaml
    @reviewer = User.find(session[:user_id])
    @performance_review = PerformanceReview.new(review_params)
    if @performance_review.save
      flash[:notice] = 'Successfully saved PR'
      @reviewer.performance_reviews << @performance_review
      @users = User.all
      render 'users/index'
    else
      #raise review_params.to_yaml
      flash[:notice] = 'Failed to save PR' + @performance_review.errors.full_messages.to_s
      render :new

    end
  end

  def show
  end

  def edit
    @user = User.find(params[:user_id])
    render :'performance_reviews/edit'
  end

  def update
  end

  def delete
  end

  def review_params
    params.require(:performance_review).permit(:user_id, feedbacks_attributes: [:rating, :comment, :question_id])
  end
end
