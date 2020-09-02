class ItemPurchasesController < ApplicationController
  before_action :move_to_devise
  before_action :move_to_root_path
  before_action :move_to_top

  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
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
  def purchase_params
    params.require(:purchase).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id]).merge(user_id: current_user.id)
  end

  def item_purchases_params
    params.permit(:token)
  end

  def  pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: item_purchases_params[:token],
      currency:'jpy'
    )
  end

  def move_to_devise
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_root_path
    item = Item.find(params[:item_id])
    if current_user.id  == item.user_id
      redirect_to root_path
    end
  end

  def move_to_top
    item = Item.find(params[:item_id])
    if item.item_purchase != nil
      redirect_to root_path
    end
  end
end
