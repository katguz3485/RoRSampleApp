class CategoriesController < ApplicationController
  include CategoriesHelper

  expose (:category)
  expose (:categories) { Category.paginate(page: params[:page], per_page: 5)}
  expose (:category_articles) {category.articles.paginate(page: params[:page], per_page: 5)}

  before_action :find_category, only: [:show, :edit, :update, :delete]
  before_action :require_admin, except: [:index, :show]

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
    #@category_articles = category.articles.paginate(page: params[:page], per_page: 5)
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

end