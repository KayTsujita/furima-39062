require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchaseaddress = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品の購入' do
    context '商品購入ができるとき' do
      it '商品情報が保存できる' do
        expect(@purchaseaddress).to be_valid
      end
      it '建物名が空でも保存できる' do
        @purchaseaddress.building = ''
        expect(@purchaseaddress).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'Tokenが空では登録できないこと' do
        @purchaseaddress.token = nil
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'Userが空では登録できないこと' do
        @purchaseaddress.user_id = nil
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("Userを入力してください")
      end
      it 'Itemが空では登録できないこと' do
        @purchaseaddress.item_id = nil
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("Itemを入力してください")
      end
      it '郵便番号が空だと購入ができない' do
        @purchaseaddress.postcode = ''
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include "郵便番号を入力してください"
      end
      it '郵便番号が正しくないと購入ができない' do
        @purchaseaddress.postcode = '123-12'
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include '郵便番号を正しく入力してください ( 例）123-4567)'
      end
      it '都道府県が空だと保存ができない' do
        @purchaseaddress.prefecture_id = '1'
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include "都道府県を入力してください"
      end
      it '市区町村が空だと保存ができない' do
        @purchaseaddress.city = ''
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include "市区町村を入力してください"
      end
      it '番地が空だと保存ができない' do
        @purchaseaddress.address = ''
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include "番地を入力してください"
      end
      it '電話番号が空だと保存ができない' do
        @purchaseaddress.phone = ''
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include "電話番号を入力してください"
      end
      it '電話番号が番号以外だと保存ができない' do
        @purchaseaddress.phone = 'AAAbbb541p２'
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include '電話番号を正しく入力してください'
      end
      it '電話番号が9桁以下だと保存ができない' do
        @purchaseaddress.phone = '090123984'
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include '電話番号を正しく入力してください'
      end
      it '電話番号が12桁以上だと保存ができない' do
        @purchaseaddress.phone = '090123984234'
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include '電話番号を正しく入力してください'
      end
    end
  end
end
