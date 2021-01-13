class Book < ApplicationRecord
  validates :title, presence: true
  validates :publisher_id, presence: true
  validates :author_id, presence: true

  has_many(:book_formats, {
    foreign_key: :book_id,
    class_name: :BookFormat,
    dependent: :destroy
  })

  belongs_to(:author, {
    foreign_key: :author_id,
    class_name: :Author
  })

  def book_format_types
    collection = []
    self.book_formats.each do |format|
      type = BookFormatType.find(format.book_format_type_id)
      collection.push(type)
    end
    collection
  end

  def author_name
    return "#{self.author.last_name}, #{self.author.first_name}"
  end

  def average_rating

  end
end
