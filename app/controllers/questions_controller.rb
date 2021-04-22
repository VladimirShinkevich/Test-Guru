class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy]
  before_action :find_test, only: %i[index create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_find

  def new;  end	

  def edit;  end

  def index
    render inline: "<%@test.questions.each_with_index do |quest, num|%> <%= num + 1 %>. <%= quest.body%> <br> <%end%>"      
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question
    else
      render :new
    end   
  end

  def destroy
    @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
  	@question = Question.find(params[:id])
  end

  def find_test
  	@test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_find
    render plain: "Question not found!"
  end

end
