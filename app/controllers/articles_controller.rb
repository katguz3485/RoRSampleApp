class ArticlesController < ApplicationController
  include ArticlesHelper

  before_action :find_article, only: [:show, :edit, :update, :delete]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def index
    @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 5)

  end

  def show
    @comments = @article.comments
    @user = @article.user
  end

  def new
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash.now[:success] = "The post was succesfully created"
      redirect_to @article
    else
      flash.now[:danger] = "Error"
      render 'new'
    end
  end


  def edit

  end

  def update
    flash[:success] = "Article was updated"
    if @article.update(article_params)
      redirect_to @article
    else
      flash.now[:danger] = "Error"
      render 'edit'
    end
  end

  def destroy
    @article = Article.destroy(params[:id])
    flash.now[:danger] = "Succesfully deleted post"
    redirect_to root_path
  end


  def find_article
    @article = Article.find(params[:id])
  end

  def require_same_user
    find_article
    if (current_user != @article.user) && !current_user.admin?
      flash.now[:danger] = "You can only edit, update ord delete your own article"
      redirect_to root_path
    end

  end
end

