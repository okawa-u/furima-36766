class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  # クラス外から呼び出すことのできないメソッド
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :state_id, :fee_id, :area_id, :delivery_day_id,
                                 :price).merge(user_id: current_user.id)
  end
  # ストロングパラメーター
  # params.require(:モデル名).permit(:キー名, :キー名)  取得したい情報を指定

  def contributor_confirmation
    redirect_to root_path if @item.user != current_user || !@item.order.nil?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
