class QuestionnairesController < ApplicationController

  before_action :find_questionnaire, only: [:show, :edit, :update]

  def index
    @questionnaires = Questionnaire.all
  end


  def show
  end

  def new
    #number_of_questions = params[:number_of_questions]
    @questionnaire = Questionnaire.new
    number_of_questions = 7
    number_of_questions.times do
      @questionnaire.questions.build
    end
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def find_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

  def questionnaire_params
    params.require(:questionnaire).permit(:title, questions_attributes: [:question_id, :title, :description, :max_rate])
  end

end
