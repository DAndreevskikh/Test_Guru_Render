class GistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage

  def create
    @test_passage = TestPassage.find(params[:test_passage_id])
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.success?
      current_user.gists.create(question: @test_passage.current_question, url: result.html_url)
      flash[:notice] =
        view_context.link_to(t('test_passages.gist.success'), result.html_url, target: '_blank',
                                                                               rel: 'noopener').html_safe
    else
      flash[:alert] = t('test_passages.gist.failure')
    end

    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end
end
