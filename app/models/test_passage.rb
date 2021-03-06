# frozen_string_literal: true

class TestPassage < ApplicationRecord
  SUCCESS_RATE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_next_question

  def test_success?
    pass_rate >= SUCCESS_RATE
  end

  def pass_rate
    ((correct_questions.to_f / test.questions.count) * 100).round
  end

  def completed?
    current_question.nil? || time_up?
  end

  def time_up?
    timer_exists? ? false : time_to_pass_test <= Time.now
  end

  def time_to_pass_test
    (created_at + test.timer.minutes).httpdate
  end

  def timer_exists?
    test.timer.nil?
  end

  def number_of_question
    test.questions.count - test.questions.order(:id).where('id > ?', current_question.id).count
  end

  def accept!(answer_ids)
    return if time_up?
    self.correct_questions += 1 if correct_answers?(answer_ids)
    succsesfuly_passed_test if test_success?
    save!
  end

  def succsesfuly_passed_test
    self.correct_passed_test = true
  end

  private

  def correct_answers?(answer_ids)
    return false if answer_ids.nil?

    correct_answer.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answer
    current_question.answers.right_answer
  end

  def next_question
    self.current_question =
      if current_question.nil?
        test.questions.first
      else
        test.questions.order(:id).where('id > ?', current_question.id).first
      end
  end

  def before_validation_set_next_question
    self.current_question = next_question
  end
end
