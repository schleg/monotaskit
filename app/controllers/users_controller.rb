class UsersController < ApplicationController

  before_filter :require_user, :except => [ :new, :create ]
  filter_access_to :all

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Registered user \"#{@user.login}\""
      if current_user
        redirect_to edit_user_path(@user)
      else
        redirect_back_or_default account_url
      end
    else
      render :action => :new
    end
  end
  
  def show
    @user = get_user
  end

  def index
    @users = User.all
  end

  def edit
    @user = get_user
    @is_admin = false #@user.roles.select{|r|r.title == "administrator"}.length > 0
  end
  
  def update
    @user = get_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Updated user \"#{@user.login}\""
      if current_user.id == @user.id
        redirect_to edit_account_url
      else
        redirect_to edit_user_path @user
      end
    else
      render :action => :edit
    end
  end

  def delete
    @user = get_user
    respond_to do |format|
      format.html # delete.html.haml
    end
  end
  
  def destroy
    @user = get_user
    redirect_to(edit_user_path(@user)) and return if params[:cancel]
    @user.destroy
    respond_to do |format|
      flash[:notice] = "#{@user.login} (#{@user.email}) was deleted"
      format.html { redirect_to users_path }
    end
  end

private 

  def get_user
    @user = current_user
    if !params[:id].nil?
      if @user.id != params[:id]
        @user = User.find params[:id]
      end
    end
    return @user
  end

end