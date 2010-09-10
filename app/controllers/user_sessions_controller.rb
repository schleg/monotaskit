class UserSessionsController < ApplicationController

  #before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Logged in successfully"
      redirect_back_or_default root_path
      return
    end
    render :action => :new
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logged out successfully"
    redirect_back_or_default new_user_session_url
  end

end