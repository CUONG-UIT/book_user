class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :title ,length: {minimum: 4},presence: true
  validates :author ,presence: true
end
