class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successfully logged in!"
      redirect_to :root
    else
      flash[:alert] = "Invalid login. Please try again"
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

end
