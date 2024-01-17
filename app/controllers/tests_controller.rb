class TestsController < ApplicationController
  def show
    @test = Test.find(params[:id])
    @questions = @test.questions
  end

  def index
    @tests = Test.all
  end
end
