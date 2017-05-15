class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(register_params)
    if @user.save
      flash[:notice] = "You signed up successfully"
      redirect_to concerts_path
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      render :new
    end
  end

  def show
   if current_user
   @user = User.find_by(id: params[:id])
    else
      redirect_to new_user_session_path
    end
 end


  private

  def register_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
