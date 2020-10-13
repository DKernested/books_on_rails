# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

Book.delete_all
Author.delete_all

filename = Rails.root.join("db/top_books.csv")

puts "Loading books from the CSV file: #{filename}"

csv_data = File.read(filename)
books = CSV.parse(csv_data, headers: true, encoding: "utf-8")

books.each do |b|
  author = Author.find_or_create_by(name: b["authors"])

  next unless author&.valid?

  book = author.books.create(
    title:           b["original_title"],
    year:            b["original_publication_year"],
    isbn:            b["isbn"],
    average_ratings: b["average_rating"]
  )
end

puts "created #{Author.count} authors"
puts "created #{Book.count} books"
