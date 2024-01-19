class QuestionsController < ApplicationController
  before_action :find_test, only: [:new, :create]
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    @test = @question.test
  end

  def edit
    @test = @question.test
  end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to question_path(@question), notice: 'Вопрос создан'
    else
      render 'new'
    end
  end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question), notice: 'Вопрос обовлён'
    else
      render 'edit'
    end
  end

  def destroy
    @test = @question.test
    @question.destroy
    redirect_to test_path(@test), notice: 'Вопрос удален'
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
