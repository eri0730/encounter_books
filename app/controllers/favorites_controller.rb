class FavoritesController < ApplicationController
  # authenticate_user!を記述してもログイン画面に遷移しない。ユーザー認証が発動する...
  # before_action :authenticate_user!, only: [:create, :destroy]
  before_action :book_params, only: [:create, :destroy]

  def create
    return unless @book.user_id != current_user.id

    Favorite.create(user_id: current_user.id, book_id: params[:id])
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, book_id: params[:id]).destroy
  end

  private

  def book_params
    @book = Book.find(params[:id])
  end
end
