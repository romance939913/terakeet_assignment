class Publisher < ApplicationRecord
  validates :name, presence: true

  has_many(:books, {
    foreign_key: :publisher_id,
    class_name: :Book,
    dependent: :destroy
  })
end
