class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :item_info, :price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, )
  end
end
