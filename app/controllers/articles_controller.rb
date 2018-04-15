require 'wechat'
class ArticlesController < ApplicationController
    load_and_authorize_resource
    include Wechat
    def show
        @article = Article.find_by(id: params[:id])
        if @article.status == "待投稿"
            flash[:danger] = "您的文章尚未投稿，请您离开之前点击标题右下角“投稿“进行投稿"
        end
    end
    def new
        get_categories
        @article = Article.new
    end

    def create
        get_categories
        @article = current_user.articles.new(article_params)
        if @article.save
            redirect_to @article
        else
            render 'new'
        end

    end

    def edit
        get_categories
        @article = Article.find_by(id:params[:id])
    end

    def update
         @article = Article.find_by(id:params[:id])      
         if @article.update(article_params)
            redirect_to @article
         else
            get_categories
            render 'edit'
         end
    end
    def destroy
        @article = Article.find_by(id:params[:id])
        @user = @article.user
        if @article.destroy
            redirect_to @user
        end
    end
    def push
         @article = Article.find_by(id:params[:id])
         if @article.update(:status => "已投稿" )
             sendMessage wechat_content @article
             redirect_to @article
         end
    end

    private
    def get_ip_port
        ip = `curl icanhazip.com`.chomp
        port = `cat #{Rails.root.to_s}/config/puma.rb | grep 'ENV.fetch("PORT")'`.match(/\d+/).to_s.to_i
        [ip, port]
    end

    def wechat_content article
        domain = Rails.configuration.app['domain']
        if domain.nil? or domain.empty?
            ip, port = get_ip_port
            domain = ip + ":" + port.to_s
        end
        content = "有新投稿:\n" + 
            "<a href=\"http://#{domain}/articles/#{article.id}\">" + 
            article.title + "</a>\n" + 
            `date`
        content
    end

    def get_categories
        @categories = Category.all.collect{
            |item|
            [item.title,item.id]
        }
    end

    def article_params
        params.require(:article).permit(:title, :category_id,
                                        :article_type, 
                                        :author, :translator, :original_author,
                                        :original_url, :source_url, :content)
        
    end

end
