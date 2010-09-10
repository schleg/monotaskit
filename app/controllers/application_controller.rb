class ApplicationController < ActionController::Base
  
  helper :all
  protect_from_forgery
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user
  before_filter { |c| Authorization.current_user = c.current_user }

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record

    # check if we a left-over user session but no record
    if !User.exists?(session[:temp_user])
      session[:temp_user] = nil
    end

    # create a temp user if needed
    if @current_user.nil? && session[:temp_user].nil?
      id = SecureRandom.hex(16)
      pwd = SecureRandom.hex(16)
      @current_user = User.create(:email => "#{id}@monotaskit.com", :login => id, :password => pwd, :password_confirmation => pwd)
      session[:temp_user] = @current_user.id
    end

    if !session[:temp_user].nil? && @current_user.id != session[:temp_user]
      temp_user = User.find session[:temp_user]
      temp_user.tasks.each do |task|
        task.user_id = @current_user.id
        task.save
      end
      session[:temp_user] = nil
    end

    return @current_user
  end

  def require_user
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to new_user_session_url
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      flash[:notice] = "You must be logged out to access this page"
      redirect_to account_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.request_uri
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end  

  def permission_denied
    flash[:notice] = "Sorry, you are not allowed to access that page"
    redirect_to root_url
  end
  
end
