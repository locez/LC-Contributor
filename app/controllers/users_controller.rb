class UsersController < ApplicationController
  load_and_authorize_resource
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page],:per_page => 10).order("updated_at desc")
    #debugger
  end
  def check
     @user = User.find(params[:id])
     @articles = Article.where(:status => "已投稿").paginate(page: params[:page],
                                              :per_page => 10).order("updated_at desc")
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserSession.new(user_session_params.to_h).save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

  def user_session_params
      params.require(:user).permit(:email, :password, :remember_me => "0")
  end

end
