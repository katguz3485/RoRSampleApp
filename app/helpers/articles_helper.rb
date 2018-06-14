module ArticlesHelper

  private
  def article_params
    params.require(:article).permit(:title, :description)
  end
end


