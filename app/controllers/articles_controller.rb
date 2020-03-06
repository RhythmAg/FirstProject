class ArticlesController < ApplicationController
  # include ArticlesHelper

  before_action :set_article, only: [:show, :edit, :update, :destroy]
  around_action :say_hello
  after_action :say_hey
  before_action :require_permission, only: [:edit, :destroy]

  def index
    @articles = current_user.articles.published
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user_id ||= current_user.id
    if @article.save
      redirect_to @article 
      flash[:success] = 'Thanks for submitting the article it will be published once reviewed.'
    else
      render :new
    end
  end

 
  def update
    if @article.update(article_params)
      redirect_to @article
      flash[:success] = 'Article was successfully updated.'
    else
      render :edit
    end
  end

  
  def destroy
    @article.destroy
    redirect_to articles_url
    flash[:success] = 'Article was successfully destroyed.'
  end

  def example
    @articles = current_user.admin? ? Article.all : Article.published
    render :index
  end

  private

    def require_permission
      return if current_user.admin?
      if current_user != Article.find(params[:id]).user
        redirect_to root_path
        flash[:success] = 'You are not authorized to perfom this action.'
      end
    end
   
    def set_article
      @article = Article.find(params[:id])
      puts 'hello from before action'
    end

    def say_hello
      puts 'hello from around action'
      yield
    end 

    def say_hey
      puts 'hello from after action'
    end  

    def article_params
      params.require(:article).permit(:name, :description, :terms_of_service, :email, :user_id, :is_published)
    end
end
