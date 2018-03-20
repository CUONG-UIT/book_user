class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments ,dependent: :destroy
  validates :title ,length: {minimum: 4},presence: true
  validates :author ,presence: true
end
