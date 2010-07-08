class SessionsController < ApplicationController
  def new
    @user_session = UserSession.new()
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Logged In"
      redirect_to root_url
    else
      render new_session_url
    end
  end
  
  def destroy
    UserSession.find(params[:id]).destroy
    flash[:notice] = "Logged Out"
    redirect_to root_url
  end
end
