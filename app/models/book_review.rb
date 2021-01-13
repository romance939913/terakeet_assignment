class BookReview < ApplicationRecord
  validates :rating, :book_id, presence: true

  belongs_to(:book, {
    foreign_key: :book_id,
    class_name: :Book
  })
end
