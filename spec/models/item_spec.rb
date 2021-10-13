require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる場合' do
      it 'categoryとarea、daysとfee、statusが存在していれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'categoryが空では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_items).to include("Category can't be blank")
      end
      it 'statusが空では保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_items).to include("Status can't be blank")
      end
      it 'feeが空では保存できない' do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_items).to include("Fee can't be blank")
      end
      it 'areaが空では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_items).to include("Area can't be blank")
      end
      it 'daysが空では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_items).to include("Days can't be blank")
      end
    end
  end
end