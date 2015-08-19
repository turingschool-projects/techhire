class Admin::UsersController < ApplicationController
  before_action :authorize!

  def index
    @users  = User.all.order("id")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      flash[:success] = "User has been updated"
      redirect_to admin_users_path
    else
      binding.pry
      flash[:errors] = "Cannot update this user"
      redirect_to admin_users_path
    end

  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User has been updated"
    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:role, :name, :title, :email)
  end
end