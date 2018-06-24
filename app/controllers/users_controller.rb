class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.all
    @users = User.paginate(page: params[:page], per_page: 2)
  end


  def create
    debugger

    @user = User.new(user_params)
    if user.save
      flash[:success] = "Welcome in our blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end

  end


  def edit


  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was succcesfully updated"
      redirect_to articles_path
    else
      flash[:danger] = "Error, please try again"
      render 'edit'

    end

  end

  def show
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 5)

  end


  private

  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
