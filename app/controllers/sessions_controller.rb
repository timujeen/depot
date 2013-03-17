class SessionsController < ApplicationController
  skip_before_filter :authorize
  def new
  end

  def create
  #  if User.count.zero?
  #    redirect_to new_users_path, notice: 'Create user with admin privileges'
  #  else
  	 user = User.find_by_name(params[:name])
  	 if user && user.authenticate(params[:password])
  	 	session[:user_id] = user.id
  	 	redirect_to admin_url
  	 else
  		redirect_to login_url, alert: "Wrong password for this user"
  	 end
  #  end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_url, notice: 'Logged out'
  end
end
