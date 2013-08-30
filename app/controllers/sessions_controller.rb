class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate params[:name], params[:password]

    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path, invalid_login: "Invalid username/password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root
  end
end
