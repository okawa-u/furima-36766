class OrdersController < ApplicationController
  before_action :set_order,only: [:index, :create]
  before_action :authenticate_user!,only: [:index, :create]

  def index  
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(order_params)
    if @purchase.valid?
      @purchase.save
     redirect_to root_path
    else
     render :index
   end
  end

  private
  def set_order
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:purchase)
    .permit(:code, :area_id, :muni, :address, :building, :phone)
    .merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
