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

  belongs_to(:publisher, {
    foreign_key: :publisher_id,
    class_name: :Publisher
  })


  def self.search(query, options)
    collection = []
    
    #gather collection of books by provided query
    if options.title_only == true
      collection = Book.where("title like ?", "%#{query}%")
    else
      author = Author.find_by(first_name: query)
      if author.nil?
        author = Author.find_by(last_name: query)
      end
      collection = author.books
    end
    
    # filter by provided book attributes in options hash
    if !!options.book_format_type_id
      collection = collection.select do |book|
        matches = book.book_formats.select do |format| 
          format.book_format_type_id == options.book_format_type_id
        end
        matches.length > 0
      end
    elsif !options.book_format_physical.nil?
      collection = collection.select do |book|
        matches = book.book_formats.select do |format|
          !BookFormatType.find(format.book_format_type_id).nil?
        end
        matches.length > 0
      end
    end
    collection
  end


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
