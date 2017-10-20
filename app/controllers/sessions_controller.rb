class SessionsController < ApplicationController

  def new
    user = User.new
    render json: user
  end

  def create
    user = User.find_by(email: params[:user][:password_digest])
    if user
      sessions[:user_id] = user.id
      # render json: user
      redirect_to "/restaurants"
    else
      render json: { message: "the session create failed, you are stupid, roman said so....." }
    end
  end

  def delete
    session.clear
    render json: {message: "Session deleted"}
  end
end
