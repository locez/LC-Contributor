class UsersController < ApplicationController
  load_and_authorize_resource
  def new
    @user = User.new
  end

  def show
      # 匿名用户无法访问仪表盘
      redirect_to root_path if current_user.id == $anony and 
          !current_user.has_role? :admin
    @user = User.find(params[:id])
    if @user.has_role? :admin
        @articles = Article.where(:status => "已投稿").paginate(page: params[:page],
                                              :per_page => 10).order("updated_at desc")
    else
        @articles = @user.articles.paginate(page: params[:page],:per_page => 10).order("updated_at desc")
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserSession.new(user_session_params.to_h).save
      flash[:success] = "欢迎加入 Linux CN 原创投稿平台!"
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
