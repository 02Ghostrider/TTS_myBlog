class UsersController < ApplicationController
	before_action :check_session
  def index
  end

  def new
  end

  def show
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  end

  private
  def check_session
  	if !session[:user_id]
  		redirect_to "/"
  	end
  end

  def users_params
  	params.require(:user).permit(:first_name, :last_name, :username, :email)
  end

end
