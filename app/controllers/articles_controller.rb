class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :delete]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  expose_decorated(:article)
  expose_decorated(:articles) {Article.paginate(page: params[:page], per_page: 5)}

  def index

  end

  def show

  end

  def new

  end


  def create
    article.user = current_user
    if article.save
      flash.now[:success] = "The post was succesfully created"
      redirect_to article
    else
      flash.now[:danger] = "Error"
      render 'new'
    end
  end


  def edit

  end

  def update
    flash[:success] = "Article was updated"
    if article.update(article_params)
      redirect_to article
    else
      flash.now[:danger] = "Error during updating article occured"
      render 'edit'
    end
  end

  def destroy
    article = Article.destroy(params[:id])
    flash.now[:danger] = "Succesfully deleted post"
    redirect_to root_path
  end


  private

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def find_article
    article = Article.find(params[:id])
  end

  def require_same_user
    find_article
    if (current_user != article.user) && !current_user.admin?
      flash.now[:danger] = "You can only edit, update ord delete your own article"
      redirect_to root_path
    end

  end

end
