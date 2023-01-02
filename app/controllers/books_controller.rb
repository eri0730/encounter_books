class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_book, only: [:show, :edit, :update]
  before_action :move_to_index, only: :edit

  def index
    @books = Book.all.order('created_at DESC')
  end

  def new
    @book_form = BookForm.new
  end

  def create
    @book_form = BookForm.new(book_form_params)
    if @book_form.valid?
      @book_form.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    # @bookから情報をハッシュとして取り出し、@book_formとしてインスタンス生成する
    book_attributes = @book.attributes
    @book_form = BookForm.new(book_attributes)

    # 編集画面にタグの情報が表示されるようにする
    @book_form.tag_name = @book.tags.first&.tag_name
  end

  def update
    # paramsの内容を反映したインスタンスを生成する
    @book_form = BookForm.new(book_form_params)

    # 画像を選択し直していない場合は、既存の画像をセットする
    @book_form.image ||= @book.image.blob

    if @book_form.valid?
      @book_form.update(book_form_params, @book)
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.user == current_user
      book.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def book_form_params
    params.require(:book_form).permit(:title, :author, :summary, :recommend, :tag_name, :image).merge(user_id: current_user.id)
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def move_to_index
    return if @book.user.id == current_user.id

    redirect_to action: :index
  end
end
