class Author < ApplicationRecord
  has_many :books
  validates :name, presence: true, uniqueness: true

  def self.ordered_by_books
    self.select("authors.*")
        .select("COUNT(authors.id) as book_count")
        .left_joins(:books)
        .group("authors.id")
        .order("book_count DESC")
  end

  def self.search(search)
    # logger.debug(search)
    if search
      Author.where("name LIKE ?", "%#{search}%").ordered_by_books
    else
      Author.ordered_by_books
    end
  end
end
