class QuestionsController < ApplicationController

  #before_action   :question_params , only: [:show, :create, :update]
  #before_action   :find_question, only: [:delete, :update]

  def new
    @question = Question.new(question_params)
  end

  def index
    @questions = Question.sorted
  end

  def update
    find_question
  end

  def show
    render :action => 'index'
  end

  def edit
    find_question
    render :action => 'edit'
  end
  def create

  end

  def delete
    find_question
    @question = @question.destroy
    render index
  end

  def find_question
    question_params
    @question = Question.find(question_params[:id])
  end

  private
  def question_params
    params.require(params[:id])
  end

end
