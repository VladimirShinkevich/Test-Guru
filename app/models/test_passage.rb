class TestPassage < ApplicationRecord
	SUCCESS_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :set_next_question
 
  def success?
    pass_rate >= SUCCESS_RATE
  end

  def pass_rate
    (correct_questions.to_f / test.questions.count) * 100
  end

  def complited?
  	current_question.nil?
  end

  def number_of_question
  	test.questions.count - test.questions.order(:id).where("id > ?", current_question.id).count
  end

  def accept!(answer_ids)
  	if correct_answer?(answer_ids)
  		self.correct_questions += 1
  	end
  	save!
  end

  private

  def correct_answer?(answer_ids)
  	correct_answers_count = correct_answers.count
  	(correct_answers_count == correct_answers.where(id: answer_ids).count) &&
  	correct_answers_count == answer_ids.count
  end

  def correct_answers
  	current_question.answers.right_answer
  end

  def next_question
    if current_question.nil?
      self.current_question = test.questions.first 
    else
      self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
    end

  end

  def set_next_question
    self.current_question = next_question
  end

end
