class BooksController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_book, only: [:show, :edit]


  def index
    @books = Book.all.order('created_at DESC')
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end
  
  def update
  end  

  private

  def book_params
    params.require(:book).permit(:title, :author, :summary, :recommend, :image).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
  end

end
