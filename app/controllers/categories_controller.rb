class CategoriesController < ApplicationController

  before_action :find_category, only: [:show]

  def new

    @category = Category.new

  end


  def index
  end


  def show

  end

  def find_category
    @category = Category.find(params[:id])

  end

end