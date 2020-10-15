class AuthorsController < ApplicationController
  def index
    @authors = Author.ordered_by_books.paginate(page: params[:page])
  end

  def show
    @author = Author.find(params[:id])
  end
end
