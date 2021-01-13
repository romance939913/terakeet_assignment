class BookFormatType < ApplicationRecord
  validates :name, :physical, presence: true
end
