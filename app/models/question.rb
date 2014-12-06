# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  description      :text
#  title            :string(255)
#  max_rate         :integer
#  questionnaire_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Question < ActiveRecord::Base
  has_many :feedbacks, dependent: :destroy
  belongs_to :questionnaire, dependent: :destroy

  before_create :set_questionnaire

  validates :max_rate, numericality: {less_than_or_equal_to: 10, greater_than_or_equal_to: 3, message: 'must be a number between 3 and 10'}
  validates :description, presence: {value: true, message: 'is required'}

  scope :sorted, lambda {order(:created_at)}

  def set_questionnaire
    if self.questionnaire_id.blank?
      self.questionnaire = Questionnaire.first
    end
  end
end
