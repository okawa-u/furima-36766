require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品機能' do
    context '正常系' do
      it '全ての項目が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
      context '異常系' do
        it '商品名がない場合は登録できないこと' do
          @item.name = nil
          @item.valid?
          expect(@item.errors[:name]).to include("can't be blank")
          # エラー文はコントローラーbinding.pryで確認可能
        end
        it '商品説明がない場合は登録できないこと' do
          @item.explanation = ''
          @item.valid?
          expect(@item.errors[:explanation]).to include("can't be blank")
        end
        it 'カテゴリーがない場合は登録できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors[:category_id]).to include('must be other than 1')
        end
        it '配送料の負担がない場合は登録できないこと' do
          @item.fee_id = 1
          @item.valid?
          expect(@item.errors[:fee_id]).to include('must be other than 1')
        end
        it '配送先がない場合は登録できないこと' do
          @item.area_id = 1
          @item.valid?
          expect(@item.errors[:area_id]).to include('must be other than 1')
        end
        it '商品の状態がなければ登録できない' do
          @item.state_id = 1
          @item.valid?
          expect(@item.errors[:state_id]).to include('must be other than 1')
        end
        it '配送日数がない場合は登録できないこと' do
          @item.delivery_day_id = 1
          @item.valid?
          expect(@item.errors[:delivery_day_id]).to include('must be other than 1')
        end
        it '価格がからだと登録できない' do
          @item.price = ''
          @item.valid?
          expect(@item.errors[:price]).to include("can't be blank")
        end
        it '価格が300円未満だと出品できない' do
          @item.price = 299
          @item.valid?
          expect(@item.errors[:price]).to include('must be greater than or equal to 300')
        end
        it '価格が10,000,000円以上だと出品できない' do
          @item.price = 10_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
        end
        it '価格が文字だと登録できない' do
          @item.price = 'aaaaa'
          @item.valid?
          expect(@item.errors[:price]).to include('is not a number')
        end
        it 'userが紐付いていなければ出品できない' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end
        it '商品画像がからでは出品できない' do
          @item.image = nil
          @item.valid?
          expect(@item.errors[:image]).to include("can't be blank")
        end
      end
    end
  end
end
