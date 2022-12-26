require 'rails_helper'

RSpec.describe Book, type: :model do
  before do
    @book = FactoryBot.build(:book)
  end

  describe '本の情報投稿' do
    context '本の情報が投稿できる場合' do
      it 'すべての値が存在していれば保存できる' do
        expect(@book).to be_valid
      end
    end

    context '本の情報が投稿できない場合' do
      it 'titleが空では保存できない' do
        @book.title = ''
        @book.valid?
        expect(@book.errors.full_messages).to include("Title can't be blank")
      end
      it 'authorが空では保存できない' do
        @book.author = ''
        @book.valid?
        expect(@book.errors.full_messages).to include("Author can't be blank")
      end
      it 'summaryが空では保存できない' do
        @book.summary = ''
        @book.valid?
        expect(@book.errors.full_messages).to include("Summary can't be blank")
      end
      it 'recommendが空では保存できない' do
        @book.recommend = ''
        @book.valid?
        expect(@book.errors.full_messages).to include("Recommend can't be blank")
      end
      it 'imageが空では保存できない' do
        @book.image = nil
        @book.valid?
        expect(@book.errors.full_messages).to include("Image can't be blank")
      end

      it 'userが紐付いていないと保存できない' do
        @book.user = nil
        @book.valid?
        expect(@book.errors.full_messages).to include('User must exist')
      end
    end
  end
end
