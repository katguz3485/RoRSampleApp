class CommentsController < ApplicationController



  http_basic_authenticate_with name: "abcdeg", password: "secret", only: :destroy

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.save
    redirect_to article_path(@comment.article)
  end


  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end


  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
