class QuestionnairesController < ApplicationController

  layout 'admin'
  before_action :confirm_admin_access
  before_action :find_questionnaire, only: [:show, :edit, :update]

  def index
    @questionnaires = Questionnaire.all
  end


  def show
   # @questions = @questionnaire.questions
    redirect_to questionnaire_questions_path(@questionnaire)
  end

  def new
    number_of_questions = params[:number_of_questions].to_i unless params[:number_of_questions].blank?
    @questionnaire = Questionnaire.new
    number_of_questions ||= 5
    number_of_questions.times do
      @questionnaire.questions.build
    end
  end

  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    if @questionnaire.save
      flash[:notice] = 'Questionnaire successfully created'
      redirect_to questionnaire_path(@questionnaire)
    end
  end

  def edit
  end

  def update
    if @questionnaire.update(questionnaire_params)
      flash[:notice]= 'Update was successful'
      redirect_to questionnaires_path
    else
      render :edit
    end
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
