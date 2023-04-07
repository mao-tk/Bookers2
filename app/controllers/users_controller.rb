class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.order(id: :desc)
    @book = Book.new
  end
  
  def create
    @book = current_user.books.new(book_params)
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
end
