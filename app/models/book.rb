class Book < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  validates :title, presence: true
  validates :author, presence: true
  validates :summary, presence: true
  validates :recommend, presence: true
  validates :image, presence: true

end
