class BooksController < ApplicationController
  def index
   # @books = Book.includes(:author).order("average_ratings DESC")
    @books = Book.search(params[:search])
  end

  def show
    @book = Book.find(params[:id])
  end
end
