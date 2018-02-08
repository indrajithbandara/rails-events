class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  # Methods in appcontroller 
  # are available to all controllers 
  # but not in views
  # helper_method makes it available in the views
  helper_method :current_user, :logged_in?

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	!!current_user
  end

  def require_user
  	if !logged_in?
  		flash[:danger] = "You must login !"
  		redirect_to root_path
  	end
  end

end
