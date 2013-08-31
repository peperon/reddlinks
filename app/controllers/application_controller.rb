class ApplicationController < ActionController::Base
  protect_from_forgery

  private
  def authorize
    unless current_user
      redirect_to login_path, alert: "You must login"
    end
  end

  def current_user
    User.find_by_id(session[:user_id])
  end
end
