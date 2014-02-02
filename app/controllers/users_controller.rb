class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      flash[:success] = "Welcome to the Blog!"
  		redirect_to @user
    else
  		render "new"
  	end
  end

  def index
    @users = User.paginate(:page => params[:page])
  end

   def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:id])
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end


  
end
