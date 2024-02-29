class Admin::QuestionsController < Admin::BaseController
    before_action :set_test, only: %i[new create]
    before_action :set_question, only: %i[show edit update destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

    def show; end

    def new
      @question = @test.questions.build
    end

    def create
      @question = @test.questions.build(question_params)
      if @question.save
        redirect_to [:admin, @question], notice: t('.success')
      else
        render :new
      end
    end

    def destroy
      @question.destroy
      redirect_to admin_test_path(@question.test), notice: t('.success')
    end

    def edit; end

    def update
      if @question.update(question_params)
        redirect_to [:admin, @question], notice: t('.success')
      else
        render :edit
      end
    end

    private

    def set_test
      @test = Test.find(params[:test_id])
    end

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:body)
    end

    def rescue_with_question_not_found
      render plain: t('.test_not_found')
    end
  end
