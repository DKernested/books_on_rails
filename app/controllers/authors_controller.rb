class AuthorsController < ApplicationController
  def index
    @authors = Author.search(params[:search]).paginate(page: params[:page])
    # @authors = Author.ordered_by_books.paginate(page: params[:page])
  end

  def show
    @author = Author.find(params[:id])
  end
end
