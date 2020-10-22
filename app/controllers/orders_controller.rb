class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :move_to_index, only: :index
  before_action :move_to_index2, only: :index

  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new(order_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:purchase).permit(:postal_code, :city, :house_number, :building, :phone_number, :prefecture_id, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def move_to_index2
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id != @item.user_id && @item.order != nil
      redirect_to root_path
    end
  end

end
