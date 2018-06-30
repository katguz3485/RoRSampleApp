class CategoriesController < ApplicationController
  include CategoriesHelper

  before_action :find_category, only: [:show]


  def index
    @categories = Category.all
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "The category was succesfully created"
      redirect_to categories_path
    else
      flash[:danger] = "Something went wrong"
      render 'new'
    end
  end


  def show

  end

  def find_category
    @category = Category.find(params[:id])

  end


end