class ItemsController < ApplicationController
  def index
    # @item = Item.order('created_at DESC')
  end

  before_action :authenticate_user!
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :state_id, :fee_id, :area_id, :delivery_day_id,
                                 :price).merge(user_id: current_user.id)
  end
end
