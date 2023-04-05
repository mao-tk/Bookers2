class BooksController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def show
  end

  def edit
  end
end
