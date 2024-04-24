class FeedbacksController < ApplicationController
  before_action :set_admin_email, only: [:create]

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      FeedbackMailer.feedback_email(@feedback, @admin_email).deliver_now
      redirect_back(fallback_location: root_path, notice: "Спасибо за ваше сообщение!")
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end

  def set_admin_email
    admin = User.find_by(type: 'Admin')
    @admin_email = admin.email if admin
  end
end

