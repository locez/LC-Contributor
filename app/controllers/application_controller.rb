class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      flash[:danger] = exception.message
      format.html { redirect_to main_app.root_url }
    end
  end
  
  private

  def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
    @current_user = User.find 2 if @current_user.nil?
    @current_user
  end

  def logged_in?
      !current_user.nil?
  end

  protected

  def handle_unverified_request
    # raise an exception
    fail ActionController::InvalidAuthenticityToken
    # or destroy session, redirect
    if current_user_session
      current_user_session.destroy
    end
    redirect_to root_url
  end

  helper_method :current_user_session, :current_user, :logged_in?
end
