class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(username: params[:sessions][:username])
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Invalid login"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
