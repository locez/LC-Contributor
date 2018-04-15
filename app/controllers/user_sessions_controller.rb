class UserSessionsController < ApplicationController
  def new
    unless current_user.nil? or current_user.has_role? :anony 
        redirect_to current_user
    end
    @user_session = UserSession.new
  end
  
  def create
      @user_session = UserSession.new(user_session_params.to_h)
    if @user_session.save
      flash[:success] = "Welcome back!"
      redirect_to current_user
    else
      render :new
    end
  end

  def auth_new
      redirect_to '/auth/github'
  end

  def auth_create
     auth = request.env['omniauth.auth']
     @user = User.where(:email => auth['info']['email']).first
     if @user.nil?
         name = auth['info']['nickname']
         email = auth['info']['email']
         password = SecureRandom.urlsafe_base64
         @user = User.create!(name: name, email: email,
                     password: password, password_confirmation: password)
     end
     @user_session = UserSession.create(@user,true)
     flash[:success] = "Welcome back!"
     redirect_to @user
     
  end

  def destroy
    current_user_session.destroy
    flash[:success] = "Goodbye!"
    redirect_to root_path
  end

  private

  def user_session_params
      params.require(:user_session).permit(:email, :password, :remember_me)
  end
end
