class QuestionsController < ApplicationController

  before_action   :find_question, only: [:destroy, :show, :edit, :update]

  def new
    @question = Question.new
    @question.position = Question.last.position + 1
  end

  def index
    @questions = Question.sorted
  end

  def update
    @old = Question.find(@question.id)
    if  @question.update(question_params)
      flash[:notice] = "Question #{@question.position} updated successfully"
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
      params.require(:question).permit(:position, :question, :summary, :max_rate)
    end

    def find_question
      @question = Question.find(params[:id])
    end

end
