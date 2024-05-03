class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test, only: %i[start]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.includes(:questions).where.not(questions: { id: nil })
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end

  def rescue_with_test_not_found
    render plain: t('.test_not_found')
  end
end
