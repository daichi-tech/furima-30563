class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @items = Item.all.order(id: "DESC")
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :information, :price, :category_id, :status_id, :delivery_fee_id, :delivery_date_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end
  
  def move_to_index
    item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == item.user_id 
      redirect_to action: :index
    end
  end
end
