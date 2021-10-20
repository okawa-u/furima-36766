class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show,:edit,:update]
  before_action :contributor_confirmation, only: [:edit, :update]

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

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :state_id, :fee_id, :area_id, :delivery_day_id,
                                 :price).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless @item.user == current_user
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
