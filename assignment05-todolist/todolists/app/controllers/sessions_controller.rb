class SessionsController < ApplicationController
  def new
  end

  def create
	user = User.find_by(username: params[:session][:username])
	if user && user.authenticate(params[:session][:password])
	 log_in user
 	 redirect_to "/list"
        else
	 flash.now[:danger] = 'Invalid username or password'
	 render 'new'
	end
  end

  def destroy
    log_out
    redirect_to login_path
  end

  def list
	user = current_user
	@list = TodoList.find_by(user_id: user[:id])
	render 'list'
  end
end
