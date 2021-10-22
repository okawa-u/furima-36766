class OrdersController < ApplicationController
  before_action :set_order,only: [:index, :create]
  before_action :authenticate_user!,only: [:index, :create]

  def index  
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
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
    .merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: purchase_params[:token],
    currency: 'jpy'
  )
  end

end
