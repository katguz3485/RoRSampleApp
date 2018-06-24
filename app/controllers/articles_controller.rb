class ArticlesController < ApplicationController
  include ArticlesHelper

  before_action :find_article, only: [:show, :edit, :update, :delete]

  http_basic_authenticate_with name: "abcdeg", password: "secret", except: [:index, :show]

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
    @article.user = User.first
    if @article.save
      flash[:success] = "The post was succesfully created"
      redirect_to @article
    else
      flash[:danger] = "Error"
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
      flash[:danger] = "Error"
      render 'edit'
    end
  end

  def destroy

    @article = Article.destroy(params[:id])
    flash[:danger] = "Succesfully deleted post"
    redirect_to root_path
  end


  def find_article
    @article = Article.find(params[:id])
  end

end

