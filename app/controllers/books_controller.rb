class BooksController < ApplicationController
  def index
    # @books = Book.includes(:author).order("average_ratings DESC")
    @books = Book.search(params[:search]).paginate(page: params[:page], per_page: 5)
  end

  def show
    @book = Book.find(params[:id])
  end
end
