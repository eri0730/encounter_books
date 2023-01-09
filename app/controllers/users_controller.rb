class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def mypage
    user = User.find(params[:id])
    return redirect_to root_path unless current_user.id == user.id
    favorites = Favorite.where(user_id: current_user.id).pluck(:book_id)
    @books = Book.find(favorites)
  end  

end
