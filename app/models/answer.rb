# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :maximum_number_of_answers, on: :create

  scope :right_answer, -> { where(correct: true) }

  def maximum_number_of_answers
    errors.add(:base, :max_answers) if question.answers.count >= 4
  end
end
