require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品保存' do
    context '商品登録できるとき' do
      it '商品保存ができる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録できないとき' do
      it '商品名が空だと保存ができない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'imageが空だと保存ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it '商品説明が空だと保存ができない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.postage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.delivery_time_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it '価格が空だと保存ができない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it '価格が半角数字以外だと保存ができない' do
        @item.price = '２４５０'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は半角数字で入力してください")
      end
      it '販売価格9,999,999円以上だと保存ができない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を販売価格範囲内で入力してください')
      end
      it '販売価格300円以下だと保存ができない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を販売価格範囲内で入力してください')
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
