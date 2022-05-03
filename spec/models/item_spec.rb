require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do
    context '出品できる場合' do
      it "item_name、item_info、price、category_id、sales_status_id、shipping_fee_status_id、prefecture_id、scheduled_delivery_idが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと出品できない' do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_infoが空だと出品できない' do
        @item.item_info = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item info can't be blank")
      end
      it 'categoryが未選択だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'sales_statusが未選択だと出品できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end
      it 'shipping_fee_statusが未選択だと出品できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end
      it 'prefectureが未選択だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'scheduled_deliveryが空だと出品できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end
      it 'priceが空だと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満では出品できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.price = "10_000_000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end
      it 'priceが全角数字だと出品できない' do
        @item.price = "２０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end