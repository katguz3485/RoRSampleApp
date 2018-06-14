class ArticlesController < ApplicationController
  include ArticlesHelper

  before_action :find_article, only: [:show, :edit, :update, :delete]

  http_basic_authenticate_with name: "abcdeg", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show

    #@article = Article.order("created_at DESC").limit(4).offset(1)
  end

  def new
    @article = Article.new
  end


  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "The post was succesfully created"
    else

      flash[:notice] = "Error"

      render 'new'
    end
  end


  def edit

  end

  def update
    flash[:notice] = "Article was updated"
    if @article.update(article_params)
      redirect_to @article
    else

      render 'edit'
    end
  end

  def destroy

    @article = Article.destroy(params[:id])
    flash[:notice] = "Succesfully deleted post"
    redirect_to root_path, notice: "Post was destroyed"


  end

  def find_article
    @article = Article.find(params[:id])
  end

=begin
  def article_params
    params.require(:article).permit(:title, :description)
  end
=end

end

