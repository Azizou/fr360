class QuestionsController < ApplicationController

  layout 'admin'

  before_action   :is_admin?
  before_action   :find_question, only: [:destroy, :show, :edit, :update]

  def new
    @question = Question.new
  end


  def index
    @questions = Question.sorted
  end

  def update
    if  @question.update(question_params)
      flash[:notice] = 'Question has been updated successfully'
      redirect_to action: :index
    else
      flash[:notice] = 'Unable to update question ensure no blank field'
      render :edit
    end
  end

  def show
  end

  def edit
  end

  def create
    @question = Question.create(question_params)
    if @question.save
      flash[:notice] = 'Question added successfully'
      redirect_to question_path(@question)
    else
      flash[:notice] = 'Unable to submit question, please fill all the filed'
      render 'new'
    end
  end

  def destroy
    @question = @question.destroy
    flash[:notice] = 'Question successfully removed'
    redirect_to action: :index
  end




  protected
    def question_params
      params.require(:question).permit(:description, :title, :max_rate)
    end

    def find_question
      @question = Question.find(params[:id])
    end

end
