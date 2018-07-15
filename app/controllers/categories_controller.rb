class CategoriesController < ApplicationController
  include CategoriesHelper


  before_action :find_category, only: [:show, :edit, :update, :delete]
  before_action :require_admin, except: [:index, :show]

  expose_decorated (:category)
  expose_decorated (:categories) { Category.paginate(page: params[:page], per_page: 5) }
  expose_decorated (:category_articles) { category.articles.paginate(page: params[:page], per_page: 5) }

  def index
  end

  def new
  end

  def create
    if category.save
      flash[:success] = "The category was succesfully created"
      redirect_to categories_path
    else
      flash[:danger] = "Something went wrong"
      render 'new'
    end
  end

  def show

  end

  def edit
  end

  def update
    flash[:success] = "Category was updated"
    if category.update(category_params)
      redirect_to category
    else
      flash.now[:danger] = "Error occcured"
      render 'edit'
    end
  end


  def require_admin
    if !logged_in? || (logged_in? and !current_user.admin?)
      flash[:danger] = "Only admins can perform this action"
      redirect_to categories_path
    end
  end


  def find_category
    category = Category.find(params[:id])
  end


  private

  def category_params
    params.require(:category).permit(:name)
  end


end