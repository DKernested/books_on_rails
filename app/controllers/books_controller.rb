class BooksController < ApplicationController
  def index
    @books = Book.includes(:author).order("average_ratings DESC")
  end

  def show
    @book = Book.find(params[:id])
  end
end
