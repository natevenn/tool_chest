class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :most_recent_tool, :tools?, :current_user

  def most_recent_tool
     Tool.find_by(id: session[:most_recent_tool_id])
  end

  def tools?
    most_recent_tool != nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
