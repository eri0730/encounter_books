class BookForm
  include ActiveModel::Model

  #BookFormクラスのオブジェクトがBookモデルの属性を扱えるようにする
  attr_accessor(
    :title, :author, :summary, 
    :recommend, :image, :user_id,
    :id, :created_at, :updated_at,
    :tag_name
  )
  with_options presence: true do
    validates :image
    validates :title
    validates :author
    validates :summary
    validates :recommend
  end

  def save
    book = Book.create(title: title, author: author, summary: summary, recommend: recommend, image: image, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    BookTagRelation.create(book_id: book.id, tag_id: tag.id)
  end

  def update(params, book)
    book.update(params)
  end


end
