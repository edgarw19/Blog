class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    sign_in user
    redirect_to root_url, :notice => "Logged in!"
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
  end

  def destroy
  	sign_out
  	redirect_to posts_url, :notice => "Logged out!"
  end


end
