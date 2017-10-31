class SessionsController < ApplicationController

  def new
    user = User.new
    # render json: user
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      # render json: user
      redirect_to "/restaurants"
    else
      render json: { message: "the session create failed, you are stupid, roman said so....." }
    end
  end

  def delete
    session.clear
    redirect_to "/restaurants"
    # render json: {message: "Session deleted"}
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
