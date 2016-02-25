class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :most_recent_tool, :tools?, :current_user, :most_recent_category


  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def most_recent_tool
   current_user.tools.find_by(id: session[:most_recent_tool_id]) if current_user
  end

  def most_recent_category
    category ||= Category.find_by(name: session[:most_recent_category_name])
  end
end
