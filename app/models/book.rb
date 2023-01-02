class Book < ApplicationRecord
  belongs_to :user
  has_many :book_tag_relations, dependent: :destroy
  has_many :tags, through: :book_tag_relations, dependent: :destroy

  has_one_attached :image
end
