class CommentsController < ApplicationController
  before_action :find_comments, only: [:edit, :update]
  expose_decorated(:comment)
  expose_decorated(:comments)

  def new
  end

  def index
  end

  def create
    comment = Comment.new(comment_params)
    comment.article_id = params[:article_id]
    if comment.save
      flash.now[:success] = "Your comment was succesfully creatreloaed"
      redirect_to article_path(comment.article)
    else
      flash.now[:danger] = "An error occurred"
      render 'new'
    end
  end

  def destroy
    article = Article.find(params[:article_id])
    comment = article.comments.find(params[:id])
    comment.destroy
    redirect_to article_comment_path(article)
  end

  def edit

  end

  def update

  end

  private

  def find_comments
    comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

end
