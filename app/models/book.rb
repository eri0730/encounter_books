class Book < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :image, presence: true
  validates :title, presence: true
  validates :author, presence: true
  validates :summary, presence: true
  validates :recommend, presence: true
end
