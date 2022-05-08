require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/peach.jpeg')
      @item.save
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
      sleep 0.1  
    end
    
  describe 'formオブジェクトのDB保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_address.building = ""
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では保存できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空白だと保存できない' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフン(-)を含んでないと保存できない' do
        @order_address.postal_code = "1333333"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idを選択していないと保存できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空白だと保存できない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressesが空白だと保存できない' do
        @order_address.addresses = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Addresses can't be blank")
      end
      it 'phone_numberが空白だと保存できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが10桁以上11桁以内の半角数字でないと保存できない' do
        @order_address.phone_number = "０８０１１１１２２２２"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが半角のハイフン(-)を含んでいると保存できない' do
        @order_address.phone_number = "080-1111-2222"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
