class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :book_params, only: [:create, :destroy]

  def create
    @user = @book.user
    current_user.favorite(@book)
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
 end

  def destroy
    current_user.favorites.find_by(book_id: @book.id).destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  private

  def book_params
    @book = Book.find(params[:book_id])
  end

end