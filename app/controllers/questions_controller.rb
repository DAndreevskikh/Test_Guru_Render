class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show destroy edit update]
  before_action :find_test, only: %i[create new]

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to test_path(@question.test)
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(@question.test)
  end

  def edit
    @test = @question.test
  end

  def update
    if @question.update(question_params)
      redirect_to test_path(@question.test), notice: 'Вопрос был обновлен.'
    else
      render :edit
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
