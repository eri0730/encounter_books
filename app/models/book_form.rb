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
    #一度タグの紐付けを消す
    book.book_tag_relations.destroy_all

    #paramsの中のタグの情報を削除。同時に、返り値としてタグの情報を変数に代入
    tag_name = params.delete(:tag_name)

    #もしタグの情報がすでに保存されていればインスタンスを取得、無ければインスタンスを新規作成
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?

    #タグを保存
    tag.save if tag_name.present?
    book.update(params)
    BookTagRelation.create(book_id: book.id, tag_id: tag.id) if tag_name.present?
  end

end