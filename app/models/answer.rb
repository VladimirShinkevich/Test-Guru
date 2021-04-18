class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :maximum_number_of_answers

  scope :right_answer, -> { where(correct: true) }

  def maximum_number_of_answers
  	errors.add(:cout_answers, ' Cannot be greater than 4!!!') if question.answers.count >= 4
  end

end
