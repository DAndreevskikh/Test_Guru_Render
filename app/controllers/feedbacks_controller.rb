class FeedbacksController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.build(feedback_params)
    if @feedback.save
      send_feedback_email
      redirect_back(fallback_location: root_path, notice: "Спасибо за ваше сообщение!")
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end

  def send_feedback_email
    admin_email = User.find_by(type: 'Admin')&.email
    FeedbackMailer.feedback_email(@feedback, admin_email).deliver_now if admin_email
  end
end
