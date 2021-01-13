class Author < ApplicationRecord
  validates :first_name, :last_name, presence: true

  has_many(:books, {
    foreign_key: :author_id,
    class_name: :Book,
    dependent: :destroy
  })
end