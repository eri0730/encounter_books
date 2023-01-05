require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'タグの投稿' do
    before do
      @tag = FactoryBot.build(:tag)
    end

    context 'タグの投稿ができる場合' do
      it 'tag_nameが正しく入力されていれば保存できる' do
        expect(@tag).to be_valid
      end

      it 'tag_nameは半角カンマで区切り、複数保存ができる' do
        @tag.tag_name = '悲しい,号泣'
        expect(@tag).to be_valid
      end

      it 'tag_nameが空でも保存できる' do
        @tag.tag_name = ''
        expect(@tag).to be_valid
      end

    end

    context 'タグの投稿ができない場合' do
      it '重複したtag_nameが存在する場合は登録できない' do
        @tag.save
        another_user = FactoryBot.build(:tag)
        another_user.tag_name = @tag.tag_name
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Tag name has already been taken")
      end
    end
  end
end