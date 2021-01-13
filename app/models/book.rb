class Book < ApplicationRecord
  validates :title, :publisher_id, :author_id, presence: true

  has_many(:book_formats, {
    foreign_key: :book_id,
    class_name: :BookFormat,
    dependent: :destroy
  })

  has_many(:ratings, {
    foreign_key: :book_id,
    class_name: :BookReview,
    dependent: :destroy
  })

  belongs_to(:author, {
    foreign_key: :author_id,
    class_name: :Author
  })

  def book_format_types
    return book_formats.map do |format|
      BookFormatType.find(format.book_format_type_id)
    end
  end

  def author_name
    return "#{author.last_name}, #{author.first_name}"
  end

  def average_rating
    ratings.reduce(0) { |acc, rtg| acc + rtg.rating } / ratings.length
  end
end
