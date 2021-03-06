class SessionsController < ApplicationController

	def register
		@user = User.create(user_params)
		if @user.valid?
			session[:user_id]=@user.id
			redirect_to "/users/#{@user.id}/show"
		else
			render json: @user.errors
		end
	end

  def login
  	@user = User.find_by_username(params[:username])
  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to "/users/#{@user.id}/show"
  	else
  		render json: "Login information notvalid"
  	end
  end

  def logout
  	session.delete(:user_id)
  	redirect_to "/"
  end

  private
  def user_params
  	params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
  end
end
