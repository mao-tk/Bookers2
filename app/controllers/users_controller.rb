class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.order(id: :desc)
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end
end
