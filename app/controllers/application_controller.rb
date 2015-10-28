class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	session[:id] ? User.find(session[:id]) : nil
  	# ternary operation same as saying this:
  	
  	# if this stuff is true then do this action else if its false then do this action.

  	# if session[:user_id]
  	# 	User.find(session[:user_id])
  	# else
  	# 	nil
  	# end
  end

end
