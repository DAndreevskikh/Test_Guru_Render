class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    return if logged_in?

    cookies[:past_url] = request.original_url
    redirect_to login_path, alert: 'Подтвердите, пожалуйста, свой адрес электронной почты и пароль.'
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
