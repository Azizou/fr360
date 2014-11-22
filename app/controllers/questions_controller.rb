class QuestionsController < ApplicationController

 # before_action   :question_params , only: [:show, :update]
  before_action   :find_question, only: [:delete, :update]

  def new
    @question = Question.new
  end

  def index
    @questions = Question.sorted
  end

  def update
  end

  def show
      @question = Question.find(params[:id])
  end

  def edit
  end

  def create
    @question = Question.new(params[:data])
    @question.save
    redirect_to @questions
  end

  def delete
    @question = @question.destroy
    render index
  end

  def find_question
    question_params
    @question = Question.find(question_params[:id])
  end

  protected
  def question_params
    #params.require(params[:id]).permit(:position, :question, :summary)
  end

end
