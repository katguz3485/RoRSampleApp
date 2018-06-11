class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "abcdeg", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create

    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Saved articles"
      redirect_to article_path(@article)
    else
      render 'new'

    end
  end

  def show
    @article = Article.find(params[:id])
    @article = Article.order("created_at DESC").limit(4).offset(1)

  end

  def edit
    @article = Article.find(params[:id])

  end

  def update
    @article = Article.find(params[:id])
    flash[:notice] = "Article was updated"
    if @article.update(article_params)
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end


  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

end

