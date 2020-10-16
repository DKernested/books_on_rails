class Book < ApplicationRecord
  belongs_to :author

  validates :title, :year, :isbn, :average_ratings, presence: true
  validates :title, uniqueness: true
  validates :year, :isbn, numericality: { only_integer: true }
  validates :average_ratings, numericality: true

  def self.search(search)
    # logger.debug(search)
    if search
      Book.where("title LIKE ?", "%#{search}%")
    else
      Book.all
    end
  end
end
