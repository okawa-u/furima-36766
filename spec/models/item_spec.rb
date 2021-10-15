require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it 'imageとname,explanation,categoryとarea、daysとfee、status,priceが存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'categoryが空では保存できない' do
        @item.category_id = 1
        @item.valid?
        binding.pry
        expect(@item.errors.full_message).to include("Category can't be blank")
      end

      it 'statusが空では保存できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_message).to include("Status can't be blank")
      end

      it 'feeが空では保存できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_message).to include("Fee can't be blank")
      end

      it 'areaが空では保存できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_message).to include("Area can't be blank")
      end

      it 'daysが空では保存できない' do
        @item.days_id = 1
        @item.valid?
        expect(@item.errors.full_message).to include("Days can't be blank")
      end

      it 'priceが空では保存できない' do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_message).to include("Price can't be blank")
      end
        
      it 'priceが299円以下では保存できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_message).to include("Price can't be blank")
      end

      it 'priceが10,000,000円以上では保存できない' do
        @item.price = 1000000000
        @item.valid?
        expect(@item.errors.full_message).to include("Price can't be blank")
      end

    end
  end
end