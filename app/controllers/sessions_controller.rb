class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:notice] = "You are successfully logged in"
      if user.company?
        redirect_to root_path
      elsif user.admin?
        redirect_to admin_dashboard_index_path
      end
    else
      flash[:notice] = "Incorrect username or password"
      render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
