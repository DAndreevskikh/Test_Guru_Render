class TestsController < ApplicationController
  before_action :set_test, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to tests_path, notice: 'Тест успешно создан.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to tests_path, notice: 'Тест успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path, notice: 'Тест успешно удален.'
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def rescue_with_test_not_found
    render plain: 'Тест не найден'
  end
end
