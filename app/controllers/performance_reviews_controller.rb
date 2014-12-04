class PerformanceReviewsController < ApplicationController

  before_action :logged_in?
  before_action :is_admin?, only: [:edit, :update]

  def index
    @user = User.find(params[:user_id])
    render 'index'
  end

  def new
    @user = User.find(params[:user_id])#params[:user_id])
    @performance_review = PerformanceReview.new
    Question.all.each do |question|
      @performance_review.feedbacks.build(question_id: question.id)
    end
    render :new
  end

  def create
    #raise review_params.to_yaml
    # instantiate a new record
    @performance_review = PerformanceReview.new(review_params)
    @performance_review.reviewer_id = current_user.id
    @performance_review.reviewee_id = params[:user_id]

    #attempt to save if
    if @performance_review.save
      flash[:notice] = 'Successfully saved PR'
      @users = User.all
      if is_admin?
        render 'users/index'
      else
        redirect_to members_path
      end
    else
      #raise review_params.to_yaml
      #Will only fail due to validations, so ..
      flash[:error] = 'You must complete all filed before submitting your review'
      render :new

    end
  end

  def show
  end

  def edit
    @user = User.find(params[:user_id])
    @performance_review = PerformanceReview.find(params[:id])
    render :'edit'
  end

  def update
  end


  def review_params
    params.require(:performance_review).permit(feedbacks_attributes: [:rating, :comment, :question_id])
  end
end
