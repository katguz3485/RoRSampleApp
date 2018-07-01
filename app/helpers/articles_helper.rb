module ArticlesHelper

  private
  def article_params
      params.require(:article).permit(:title, :description, category_ids: [])
  end
end


