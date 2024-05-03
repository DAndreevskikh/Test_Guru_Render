class FeedbackMailer < ApplicationMailer
  def feedback_email(feedback, admin_email)
    @feedback = feedback
    mail(to: admin_email, subject: 'Новое сообщение обратной связи')
  end
end