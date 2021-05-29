# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.new_record?
      question.test.title
    else
      question.test.title
    end
  end
end
