class SessionsController < ApplicationController
	def new
		@user = User.new
	end
	def create
		@user = User.find_by_email(params[:email])

		if @user && user.authenticate(params[:password])
			session[:user_id] = @user.id   
			redirect_to '/'
		else
			redirect_to '/signup'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end
end
