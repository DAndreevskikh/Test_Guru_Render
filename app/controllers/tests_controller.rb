class TestsController < ApplicationController
  before_action :set_test, only: %i[show start edit update destroy]

  def index
   @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test, notice: 'Тест успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: 'Тест успешно удален.'
  end

  def start
    @user = User.first
    @user.tests.push(@test)
    redirect_to @user.tests_passing(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end