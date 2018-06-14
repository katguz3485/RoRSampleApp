require 'articles_controller'

class CommentsController < ApplicationController


  #before_action :find_article, only: [:create, :destroy]
  #before_action :find_comment, only: [:create, :destroy]

  http_basic_authenticate_with name: "abcdeg", password: "secret", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)

  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  def find_comment
    @article = @article.comments.find(params[:id])
  end

  def find_article
    @article = Article.find(params[:article_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
