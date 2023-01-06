class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :favorites

  validates :nickname, presence: true


  def favorite(book)
    Favorite.create!(user_id: id, book_id: book.id)
  end

  # 投稿のお気に入り解除する
  def unfavorite(book)
    Favorite.find_by(user_id: id, book_id: book.id).destroy
  end

  # 現在のユーザーがお気に入り登録してたらtrueを返す
  def favorite?(book)
    !Favorite.find_by(user_id: id, book_id: book.id).nil?
  end

end
