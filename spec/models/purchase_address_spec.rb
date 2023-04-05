require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchaseaddress = FactoryBot.build(:purchase_address)
  end

  describe '商品の購入' do
    context '商品購入ができるとき' do
      it '商品情報が保存できる' do
        expect(@purchaseaddress).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it 'Tokenが空では登録できないこと' do
        @purchaseaddress.token = nil
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入ができない' do
        @purchaseaddress.postcode = ''
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include "Postcode can't be blank"
      end
      it '郵便番号が正しくないと購入ができない' do
        @purchaseaddress.postcode = '123-12'
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include 'Postcode is invalid. Enter it as follows (e.g. 123-4567)'
      end
      it '都道府県が空だと保存ができない' do
        @purchaseaddress.prefecture_id = '1'
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市区町村が空だと保存ができない' do
        @purchaseaddress.city = ''
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空だと保存ができない' do
        @purchaseaddress.address = ''
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号が空だと保存ができない' do
        @purchaseaddress.phone = ''
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include "Phone can't be blank"
      end
      it '電話番号が番号以外だと保存ができない' do
        @purchaseaddress.phone = 'AAAbbb541p２'
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include 'Phone is invalid. Input only number'
      end
      it '電話番号が11桁でないと保存ができない' do
        @purchaseaddress.phone = '0901239843'
        @purchaseaddress.valid?
        expect(@purchaseaddress.errors.full_messages).to include 'Phone is too short'
      end
    end
  end
end
