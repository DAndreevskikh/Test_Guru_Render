class FeedbacksController < ApplicationController
  before_action :set_admin_email, only: [:create]

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.valid?
      FeedbackMailer.feedback_email(@feedback, @admin_email).deliver_now
      redirect_to root_path, notice: 'Ваше сообщение успешно отправлено.'
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end

  def set_admin_email
    @admin_email = User.find_by(admin: true).email
  end
end
