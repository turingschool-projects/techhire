class Admin::UsersController < ApplicationController

  def index
    @users  = User.all.order("id")
  end

  def edit
    @user = current_user
  end

  def update
    binding.pry
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to admin_users_path
    else
      flash[:errors] = "Cannot update this user"
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password,
                                 :password_confirmation,
                                 :role, :name, :title)
  end
end