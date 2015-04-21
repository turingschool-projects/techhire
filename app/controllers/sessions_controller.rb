class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      flash[:notice] = "You are successfully logged in"
      redirect_to admins_dashboard_index_path
    # else
      # flash[:notice] = "Incorrect username or password"
    #   render :new
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
