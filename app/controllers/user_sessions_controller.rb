class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new()
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to "/"
    else
      render :action=>:new
    end
  end
  
  def destroy
    UserSession.find(params[:id]).destroy
    redirect_to "/"
  end
end
