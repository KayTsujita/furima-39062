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
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'imageが空だと保存ができない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品説明が空だと保存ができない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが空だと保存ができない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態が空だと保存ができない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担が空だと保存ができない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '発送元の地域が空だと保存ができない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が空だと保存ができない' do
        @item.delivery_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it '価格が空だと保存ができない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が半角数字以外だと保存ができない' do
        @item.price = '２４５０'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters')
      end
      it '販売価格9,999,999円以上だと保存ができない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it '販売価格300円以下だと保存ができない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
