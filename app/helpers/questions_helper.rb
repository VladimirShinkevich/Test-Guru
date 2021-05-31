# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.new_record?
      t('.create_question', title: question.test.title)
    else
      t('.edit', title: question.test.title)
    end
  end
end
