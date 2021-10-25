class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @purchase = Purchase.new
    redirect_to root_path if current_user == @item.user || !@item.order.nil?
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_order
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase)
          .permit(:code, :area_id, :muni, :address, :building, :phone)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  # order_params[:price]としてpriceの情報が、order_params[:token]としてtokenの情報を取得

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
