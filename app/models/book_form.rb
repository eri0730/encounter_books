class BookForm
  include ActiveModel::Model

  #BookFormクラスのオブジェクトがBookモデルの属性を扱えるようにする
  attr_accessor :title, :author, :summary, :recommend, :image, :user_id

  with_options presence: true do
    validates :image
    validates :title
    validates :author
    validates :summary
    validates :recommend
  end

  def save
    Book.create(title: title, author: author, summary: summary, recommend: recommend, image: image, user_id: user_id)
  end

end
