class SessionsController < ApplicationController
	
	def create
		@user = User.find_by(username: params[:username])
		if @user and @user.password == params[:password]
			flash[:notice] = "Successfully signed in!"
			session[:id] = @user.id
		else
			flash[:alert] = "Something went wrong."
		end
		redirect_to :back
	end

	def destroy
		session[:id] = nil
		flash[:notice] = "Logged out."
		redirect_to :back
	end

end