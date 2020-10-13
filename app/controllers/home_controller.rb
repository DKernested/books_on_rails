class HomeController < ApplicationController
  def index
    @books = Book.includes(:author)
                 .order("average_ratings DESC")
                 .limit(25)

    @authors = Author.limit(10)
  end
end
