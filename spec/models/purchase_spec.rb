require 'rails_helper'

RSpec.describe User, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase = FactoryBot.build(:purchase, user_id: @user.id, item_id: @item.id)
      sleep 0.1
    end

    context '正常系' do
      it '全ての項目が入力されていれば購入できる' do
        expect(@purchase).to be_valid
      end
      it '建物名は空でも保存できること' do
        @purchase.building = ''
        expect(@purchase).to be_valid
      end
    end

    context '異常系' do
      it '郵便番号が空だと保存できない' do
        @purchase.code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ形式でないと保存できない' do
        @purchase.code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Code is invalid')
      end
      it '郵便番号が８桁だと保存できない' do
        @purchase.code = '123-12345'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Code is invalid')
      end
      it '郵便番号の文字数が足りないと保存できない' do
        @purchase.code = '123-123'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Code is invalid')
      end
      it '都道府県、選択がない場合は登録できない' do
        @purchase.area_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Area を選択してください')
      end
      it '都道府県、空の場合は登録できない' do
        @purchase.area_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Area を選択してください')
      end
      it '市町が空だと保存できない' do
        @purchase.muni = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Muni can't be blank")
      end
      it '番地が空だと保存できない' do
        @purchase.address = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @purchase.phone = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone can't be blank")
      end
      it '電話番号が12桁以上だと保存できない' do
        @purchase.phone = '123456789101112'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone is too long (maximum is 11 characters)')
      end
      it '電話番号が足りない場合だと保存できない' do
        @purchase.phone = 12_345
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone is invalid')
      end
      it '電話番号が異常な番号の場合だと保存できない' do
        @purchase.phone = 123 - 123 - 123
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone is invalid')
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase.item_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
