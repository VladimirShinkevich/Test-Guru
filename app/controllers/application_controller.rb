class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def autheticate_user!
    unless current_user
      redirect_to login_path, alert: 'Are you a Guru? Verify your email and password!'
    end
    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id]) if session[:current_user_id]
  end

  def logged_in?
    current_user.present?
  end

end
