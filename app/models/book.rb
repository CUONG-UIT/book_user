class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments ,dependent: :destroy
  validates :title ,length: {minimum: 4},presence: true
  validates :author ,presence: true

  has_attached_file :book_img, styles: { book_index: "250x350>", book_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\z/
  #add file image 
  
end
