class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  rescue_from NoMethodError, with: :rescue_with_no_method_error

  def show; end

  def result; end

  def gist
    service_result = GistQuestionService.new(@test_passage.current_question).call

    if service_result.success?
      current_user.gists.create(question: @test_passage.current_question, url: service_result.html_url)
    
      flash[:notice] = view_context.link_to 'Gist создан. Посмотреть.', service_result.html_url, target: '_blank'
    else
      flash[:alert] = 'Не удалось создать Gist.'
    end

    redirect_to @test_passage
 end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def rescue_with_no_method_error
    render plain: t('.no_answer')
  end
end
