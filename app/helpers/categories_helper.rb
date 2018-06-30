module CategoriesHelper

  private

  def category_params
    params.require(:category).permit(:name)
  end


end